// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Wallpaper _$$_WallpaperFromJson(Map<String, dynamic> json) => _$_Wallpaper(
      id: json['id'] as String,
      views: json['views'] as int,
      favorites: json['favorites'] as int,
      category: json['category'] as String,
      dimentionX: json['dimention_x'] as int?,
      dimentionY: json['dimention_y'] as int?,
      resolution: json['resolution'] as String,
      ratio: json['ratio'] as String,
      fileSize: json['file_size'] as int,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => HexColor.fromJson(e as String))
          .toList(),
      path: json['path'] as String,
      thumbs: Thumbs.fromJson(json['thumbs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WallpaperToJson(_$_Wallpaper instance) =>
    <String, dynamic>{
      'id': instance.id,
      'views': instance.views,
      'favorites': instance.favorites,
      'category': instance.category,
      'dimention_x': instance.dimentionX,
      'dimention_y': instance.dimentionY,
      'resolution': instance.resolution,
      'ratio': instance.ratio,
      'file_size': instance.fileSize,
      'colors': instance.colors,
      'path': instance.path,
      'thumbs': instance.thumbs,
    };
