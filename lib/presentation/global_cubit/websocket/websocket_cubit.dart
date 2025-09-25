import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/domain/models/socket_response.dart';
import 'package:gpspro/presentation/repository/i_websocket_repo.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/cubit/live_map_cubit.dart';
import 'package:injectable/injectable.dart';

part 'websocket_cubit.freezed.dart';
part 'websocket_state.dart';

@singleton
class WebsocketCubit extends Cubit<WebsocketState> {
  WebsocketCubit({
    required this.websocketRepo,
    required this.deviceCubit,
    required this.liveMapCubit,
  }) : super(const WebsocketState.inactive());

  final WebSocketRepo websocketRepo;
  final MyDevicesCubit deviceCubit;
  final LiveMapCubit liveMapCubit;

  int wsDelaySeconds = 1;
  StreamSubscription? _socketSubscription;
  int connections = 0;

  Timer? _reconnectTimer;

  void init() {
    if (_socketSubscription == null || isClosed) {
      _connectSocket();
    }
  }

  Future<void> _connectSocket() async {
    try {
      if (_socketSubscription != null) return;

      final stream = await websocketRepo.connectSocket();
      _socketSubscription = stream.listen(
        (event) {
          final data = json.decode(event);
          final SocketResponse response = SocketResponse.fromJson(data as Map<String, dynamic>);

          _handleSocketResponse(response);
        },
        cancelOnError: true,
        onError: (error) {
          _socketSubscription = null;
          AppLogger.error('Connection error');
          emit(_ErrorState('Connection error $error'));
          _reconnect();
        },
        onDone: () {
          _socketSubscription = null;
          AppLogger.info('Connection closed');
          emit(const _InactiveState());
          _reconnect();
        },
      );

      connections += 1;
    } catch (e) {
      AppLogger.error('Connection error: $e');
      emit(_ErrorState('Connection error $e'));
      _reconnect();
    }
  }

  void _handleSocketResponse(SocketResponse response) {
    if (response.positions != null) {
      for (PositionModel item in response.positions!) {
        deviceCubit.updateDevicePosition(item.deviceId, item);
        liveMapCubit.updateMarker(item.deviceId, item);
      }
    } else if (response.devices != null) {
      for (var device in response.devices!) {
        deviceCubit.updateDevice(device);
      }
    } else if (response.events != null) {}

    if (!isClosed) emit(_IdleState(response));
  }

  void _reconnect() {
    _reconnectTimer?.cancel();

    _reconnectTimer = Timer(Duration(seconds: wsDelaySeconds), () async {
      if (isClosed) return;
      try {
        await locator.get<AuthCubit>().refetchUserSession();
        AppLogger.info('Retrying connection');
        await _connectSocket();
      } catch (e) {
        AppLogger.error('Error during reconnection: $e');
      }
    });
  }

  @override
  Future<void> close() async {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;

    await _socketSubscription?.cancel();
    _socketSubscription = null;

    return super.close();
  }

  void disconnect() {
    try {
      if (_socketSubscription != null) {
        log('Subscription disconnected');
        _socketSubscription!.cancel();
        _socketSubscription = null;
        connections -= 1;
      }

      _reconnectTimer?.cancel();
      _reconnectTimer = null;
    } catch (e) {
      AppLogger.error('Error while disconnecting: $e');
    }
  }

  void reconnect() {
    if (_socketSubscription == null) {
      _reconnect();
    }
  }
}
