// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_wall/domain/base/pagination_meta.dart';

part 'pagination.g.dart';

@JsonSerializable(
    includeIfNull: false, explicitToJson: true, genericArgumentFactories: true)
class Pagination<T> {
  Pagination({
    this.items,
    required this.meta,
  });

  factory Pagination.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$PaginationFromJson<T>(json, fromJsonT);

  @JsonKey(name: 'data')
  final List<T>? items;
  final PaginationMeta meta;

  Map<String, dynamic> toJson(Object? Function(T)? toJsonT) =>
      _$PaginationToJson(this, toJsonT!);
}
