// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_wall/domain/entity/thumbs.dart';
import 'package:great_wall/utils/hex_color.dart';

part 'wallpaper.freezed.dart';
part 'wallpaper.g.dart';

@freezed
class Wallpaper with _$Wallpaper {
  const Wallpaper._();
  const factory Wallpaper({
    required String id,
    required int views,
    required int favorites,
    required String category,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'dimention_x') required int dimentionX,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'dimention_y') required int dimentionY,
    required String ratio,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'file_size') required int fileSize,
    required List<HexColor> colors,
    required String path,
    required Thumbs thumbs,
  }) = _Wallpaper;

  @JsonKey(includeFromJson: false, includeToJson: true)
  String get resolution => '${dimentionX}x$dimentionY';

  factory Wallpaper.fromJson(Map<String, Object?> json) =>
      _$WallpaperFromJson(json);
}