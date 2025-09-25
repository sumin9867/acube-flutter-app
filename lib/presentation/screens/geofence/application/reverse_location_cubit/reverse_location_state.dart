part of 'reverse_location_cubit.dart';

@freezed
class ReverseLocationState with _$ReverseLocationState {
  const factory ReverseLocationState.initial() = _Initial;

    const factory ReverseLocationState.loading() = _LoadingState;
  const factory ReverseLocationState.empty() = _EmptyState;

  const factory ReverseLocationState.error(String errorMsg) = _ErrorState;
  const factory ReverseLocationState.idle(SearchLocationModel viewModel) =
      _IdleState;
}
