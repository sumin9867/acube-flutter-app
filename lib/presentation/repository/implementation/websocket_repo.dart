import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:gpspro/data/sources/remote_source.dart';
import 'package:gpspro/presentation/repository/i_websocket_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/io.dart';

@LazySingleton(as: WebSocketRepo)
class WebSocketRepoImp implements WebSocketRepo {
  final RemoteSource remoteSource;

  const WebSocketRepoImp({
    required this.remoteSource,
  });

  @override
  Future<Stream> connectSocket() async {
    try {
      final userSession = locator<AuthCubit>().userSession;
      if (userSession == null) {
        throw Exception('No user session available for WebSocket connection');
      }
      final cookie = userSession.cookie;
      final channel = IOWebSocketChannel.connect(
        Uri.parse('wss://itsochvts.com/api/socket'),
        headers: <String, String>{
          'Cookie': cookie ?? '',
        },
        pingInterval: const Duration(seconds: 20),
      );
      await channel.ready;
      return channel.stream;
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException();
    }
  }
}
