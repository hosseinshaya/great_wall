// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallpaper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Wallpaper _$WallpaperFromJson(Map<String, dynamic> json) {
  return _Wallpaper.fromJson(json);
}

/// @nodoc
mixin _$Wallpaper {
  String get id => throw _privateConstructorUsedError;
  int get views => throw _privateConstructorUsedError;
  int get favorites => throw _privateConstructorUsedError;
  String get category =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'dimention_x')
  int? get dimentionX =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'dimention_y')
  int? get dimentionY => throw _privateConstructorUsedError;
  String get resolution => throw _privateConstructorUsedError;
  String get ratio =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'file_size')
  int get fileSize => throw _privateConstructorUsedError;
  List<HexColor> get colors => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  Thumbs get thumbs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WallpaperCopyWith<Wallpaper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WallpaperCopyWith<$Res> {
  factory $WallpaperCopyWith(Wallpaper value, $Res Function(Wallpaper) then) =
      _$WallpaperCopyWithImpl<$Res, Wallpaper>;
  @useResult
  $Res call(
      {String id,
      int views,
      int favorites,
      String category,
      @JsonKey(name: 'dimention_x') int? dimentionX,
      @JsonKey(name: 'dimention_y') int? dimentionY,
      String resolution,
      String ratio,
      @JsonKey(name: 'file_size') int fileSize,
      List<HexColor> colors,
      String path,
      Thumbs thumbs});

  $ThumbsCopyWith<$Res> get thumbs;
}

/// @nodoc
class _$WallpaperCopyWithImpl<$Res, $Val extends Wallpaper>
    implements $WallpaperCopyWith<$Res> {
  _$WallpaperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? views = null,
    Object? favorites = null,
    Object? category = null,
    Object? dimentionX = freezed,
    Object? dimentionY = freezed,
    Object? resolution = null,
    Object? ratio = null,
    Object? fileSize = null,
    Object? colors = null,
    Object? path = null,
    Object? thumbs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      dimentionX: freezed == dimentionX
          ? _value.dimentionX
          : dimentionX // ignore: cast_nullable_to_non_nullable
              as int?,
      dimentionY: freezed == dimentionY
          ? _value.dimentionY
          : dimentionY // ignore: cast_nullable_to_non_nullable
              as int?,
      resolution: null == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String,
      ratio: null == ratio
          ? _value.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<HexColor>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      thumbs: null == thumbs
          ? _value.thumbs
          : thumbs // ignore: cast_nullable_to_non_nullable
              as Thumbs,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThumbsCopyWith<$Res> get thumbs {
    return $ThumbsCopyWith<$Res>(_value.thumbs, (value) {
      return _then(_value.copyWith(thumbs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WallpaperCopyWith<$Res> implements $WallpaperCopyWith<$Res> {
  factory _$$_WallpaperCopyWith(
          _$_Wallpaper value, $Res Function(_$_Wallpaper) then) =
      __$$_WallpaperCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int views,
      int favorites,
      String category,
      @JsonKey(name: 'dimention_x') int? dimentionX,
      @JsonKey(name: 'dimention_y') int? dimentionY,
      String resolution,
      String ratio,
      @JsonKey(name: 'file_size') int fileSize,
      List<HexColor> colors,
      String path,
      Thumbs thumbs});

  @override
  $ThumbsCopyWith<$Res> get thumbs;
}

/// @nodoc
class __$$_WallpaperCopyWithImpl<$Res>
    extends _$WallpaperCopyWithImpl<$Res, _$_Wallpaper>
    implements _$$_WallpaperCopyWith<$Res> {
  __$$_WallpaperCopyWithImpl(
      _$_Wallpaper _value, $Res Function(_$_Wallpaper) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? views = null,
    Object? favorites = null,
    Object? category = null,
    Object? dimentionX = freezed,
    Object? dimentionY = freezed,
    Object? resolution = null,
    Object? ratio = null,
    Object? fileSize = null,
    Object? colors = null,
    Object? path = null,
    Object? thumbs = null,
  }) {
    return _then(_$_Wallpaper(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      dimentionX: freezed == dimentionX
          ? _value.dimentionX
          : dimentionX // ignore: cast_nullable_to_non_nullable
              as int?,
      dimentionY: freezed == dimentionY
          ? _value.dimentionY
          : dimentionY // ignore: cast_nullable_to_non_nullable
              as int?,
      resolution: null == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String,
      ratio: null == ratio
          ? _value.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<HexColor>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      thumbs: null == thumbs
          ? _value.thumbs
          : thumbs // ignore: cast_nullable_to_non_nullable
              as Thumbs,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Wallpaper implements _Wallpaper {
  const _$_Wallpaper(
      {required this.id,
      required this.views,
      required this.favorites,
      required this.category,
      @JsonKey(name: 'dimention_x') this.dimentionX,
      @JsonKey(name: 'dimention_y') this.dimentionY,
      required this.resolution,
      required this.ratio,
      @JsonKey(name: 'file_size') required this.fileSize,
      required final List<HexColor> colors,
      required this.path,
      required this.thumbs})
      : _colors = colors;

  factory _$_Wallpaper.fromJson(Map<String, dynamic> json) =>
      _$$_WallpaperFromJson(json);

  @override
  final String id;
  @override
  final int views;
  @override
  final int favorites;
  @override
  final String category;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'dimention_x')
  final int? dimentionX;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'dimention_y')
  final int? dimentionY;
  @override
  final String resolution;
  @override
  final String ratio;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'file_size')
  final int fileSize;
  final List<HexColor> _colors;
  @override
  List<HexColor> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  final String path;
  @override
  final Thumbs thumbs;

  @override
  String toString() {
    return 'Wallpaper(id: $id, views: $views, favorites: $favorites, category: $category, dimentionX: $dimentionX, dimentionY: $dimentionY, resolution: $resolution, ratio: $ratio, fileSize: $fileSize, colors: $colors, path: $path, thumbs: $thumbs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Wallpaper &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.favorites, favorites) ||
                other.favorites == favorites) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.dimentionX, dimentionX) ||
                other.dimentionX == dimentionX) &&
            (identical(other.dimentionY, dimentionY) ||
                other.dimentionY == dimentionY) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.thumbs, thumbs) || other.thumbs == thumbs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      views,
      favorites,
      category,
      dimentionX,
      dimentionY,
      resolution,
      ratio,
      fileSize,
      const DeepCollectionEquality().hash(_colors),
      path,
      thumbs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WallpaperCopyWith<_$_Wallpaper> get copyWith =>
      __$$_WallpaperCopyWithImpl<_$_Wallpaper>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WallpaperToJson(
      this,
    );
  }
}

abstract class _Wallpaper implements Wallpaper {
  const factory _Wallpaper(
      {required final String id,
      required final int views,
      required final int favorites,
      required final String category,
      @JsonKey(name: 'dimention_x') final int? dimentionX,
      @JsonKey(name: 'dimention_y') final int? dimentionY,
      required final String resolution,
      required final String ratio,
      @JsonKey(name: 'file_size') required final int fileSize,
      required final List<HexColor> colors,
      required final String path,
      required final Thumbs thumbs}) = _$_Wallpaper;

  factory _Wallpaper.fromJson(Map<String, dynamic> json) =
      _$_Wallpaper.fromJson;

  @override
  String get id;
  @override
  int get views;
  @override
  int get favorites;
  @override
  String get category;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'dimention_x')
  int? get dimentionX;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'dimention_y')
  int? get dimentionY;
  @override
  String get resolution;
  @override
  String get ratio;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'file_size')
  int get fileSize;
  @override
  List<HexColor> get colors;
  @override
  String get path;
  @override
  Thumbs get thumbs;
  @override
  @JsonKey(ignore: true)
  _$$_WallpaperCopyWith<_$_Wallpaper> get copyWith =>
      throw _privateConstructorUsedError;
}
