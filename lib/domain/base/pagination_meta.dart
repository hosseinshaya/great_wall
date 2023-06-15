// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_meta.freezed.dart';
part 'pagination_meta.g.dart';

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'current_page') required int currentPage,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'last_page') required int lastPage,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'per_page') required int perPage,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'total') required int total,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, Object?> json) =>
      _$PaginationMetaFromJson(json);
}
