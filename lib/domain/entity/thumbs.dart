// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'thumbs.freezed.dart';
part 'thumbs.g.dart';

@freezed
class Thumbs with _$Thumbs {
  const Thumbs._();
  const factory Thumbs({
    required String small,
    required String original,
    required String large,
  }) = _Thumbs;

  factory Thumbs.fromJson(Map<String, Object?> json) =>
      _$ThumbsFromJson(json);
}
