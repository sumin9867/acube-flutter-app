part of 'websocket_cubit.dart';

@freezed
class WebsocketState with _$WebsocketState {
  const factory WebsocketState.inactive() = _InactiveState;
  const factory WebsocketState.loading() = _LoadingState;
  const factory WebsocketState.idle(SocketResponse response) = _IdleState;
  const factory WebsocketState.error(String errorMessage) = _ErrorState;
}
