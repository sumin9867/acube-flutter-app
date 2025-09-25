part of 'search_location_cubit.dart';

@freezed
class SearchLocationState with _$SearchLocationState {
  const factory SearchLocationState.initial() = _Initial;
  const factory SearchLocationState.loading() = _LoadingState;
  const factory SearchLocationState.empty() = _EmptyState;

  const factory SearchLocationState.error(String errorMsg) = _ErrorState;
  const factory SearchLocationState.idle(List<SearchLocationModel> viewModel) =
      _IdleState;
}
