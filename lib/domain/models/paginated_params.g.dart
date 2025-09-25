// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedParamsImpl _$$PaginatedParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedParamsImpl(
      pageSize: (json['per_page'] as num).toInt(),
      pageNumber: (json['current_page'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginatedParamsImplToJson(
        _$PaginatedParamsImpl instance) =>
    <String, dynamic>{
      'per_page': instance.pageSize,
      'current_page': instance.pageNumber,
    };
