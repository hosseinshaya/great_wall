// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thumbs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Thumbs _$ThumbsFromJson(Map<String, dynamic> json) {
  return _Thumbs.fromJson(json);
}

/// @nodoc
mixin _$Thumbs {
  String get small => throw _privateConstructorUsedError;
  String get original => throw _privateConstructorUsedError;
  String get large => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThumbsCopyWith<Thumbs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThumbsCopyWith<$Res> {
  factory $ThumbsCopyWith(Thumbs value, $Res Function(Thumbs) then) =
      _$ThumbsCopyWithImpl<$Res, Thumbs>;
  @useResult
  $Res call({String small, String original, String large});
}

/// @nodoc
class _$ThumbsCopyWithImpl<$Res, $Val extends Thumbs>
    implements $ThumbsCopyWith<$Res> {
  _$ThumbsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? small = null,
    Object? original = null,
    Object? large = null,
  }) {
    return _then(_value.copyWith(
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String,
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      large: null == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThumbsCopyWith<$Res> implements $ThumbsCopyWith<$Res> {
  factory _$$_ThumbsCopyWith(_$_Thumbs value, $Res Function(_$_Thumbs) then) =
      __$$_ThumbsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String small, String original, String large});
}

/// @nodoc
class __$$_ThumbsCopyWithImpl<$Res>
    extends _$ThumbsCopyWithImpl<$Res, _$_Thumbs>
    implements _$$_ThumbsCopyWith<$Res> {
  __$$_ThumbsCopyWithImpl(_$_Thumbs _value, $Res Function(_$_Thumbs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? small = null,
    Object? original = null,
    Object? large = null,
  }) {
    return _then(_$_Thumbs(
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String,
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      large: null == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Thumbs extends _Thumbs {
  const _$_Thumbs(
      {required this.small, required this.original, required this.large})
      : super._();

  factory _$_Thumbs.fromJson(Map<String, dynamic> json) =>
      _$$_ThumbsFromJson(json);

  @override
  final String small;
  @override
  final String original;
  @override
  final String large;

  @override
  String toString() {
    return 'Thumbs(small: $small, original: $original, large: $large)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Thumbs &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.large, large) || other.large == large));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, small, original, large);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThumbsCopyWith<_$_Thumbs> get copyWith =>
      __$$_ThumbsCopyWithImpl<_$_Thumbs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThumbsToJson(
      this,
    );
  }
}

abstract class _Thumbs extends Thumbs {
  const factory _Thumbs(
      {required final String small,
      required final String original,
      required final String large}) = _$_Thumbs;
  const _Thumbs._() : super._();

  factory _Thumbs.fromJson(Map<String, dynamic> json) = _$_Thumbs.fromJson;

  @override
  String get small;
  @override
  String get original;
  @override
  String get large;
  @override
  @JsonKey(ignore: true)
  _$$_ThumbsCopyWith<_$_Thumbs> get copyWith =>
      throw _privateConstructorUsedError;
}
