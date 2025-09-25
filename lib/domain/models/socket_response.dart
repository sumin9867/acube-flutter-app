import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';

part 'socket_response.freezed.dart';
part 'socket_response.g.dart';

@freezed
class SocketResponse with _$SocketResponse {
  const factory SocketResponse({
    List<PositionModel>? positions,
    List<Device>? devices,
    List<VehicleEvent>? events,
  }) = _SocketResponse;

  factory SocketResponse.fromJson(Map<String, dynamic> json) =>
      _$SocketResponseFromJson(json);
}
