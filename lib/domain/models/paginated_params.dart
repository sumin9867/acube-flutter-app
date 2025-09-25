import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_params.freezed.dart';
part 'paginated_params.g.dart';

@freezed
class PaginatedParams with _$PaginatedParams {
  const PaginatedParams._();
  factory PaginatedParams({
    @JsonKey(name: 'per_page') required int pageSize,
    @JsonKey(name: 'current_page') required int pageNumber,
  }) = _PaginatedParams;

  factory PaginatedParams.fromJson(Map<String, dynamic> json) =>
      _$PaginatedParamsFromJson(json);
}
