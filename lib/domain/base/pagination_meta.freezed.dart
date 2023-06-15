// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) {
  return _PaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$PaginationMeta {
// ignore: invalid_annotation_target
  @JsonKey(name: 'current_page')
  int get currentPage =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'last_page')
  int get lastPage =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'per_page')
  int get perPage =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationMetaCopyWith<PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationMetaCopyWith<$Res> {
  factory $PaginationMetaCopyWith(
          PaginationMeta value, $Res Function(PaginationMeta) then) =
      _$PaginationMetaCopyWithImpl<$Res, PaginationMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      @JsonKey(name: 'total') int total});
}

/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res, $Val extends PaginationMeta>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationMetaCopyWith<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  factory _$$_PaginationMetaCopyWith(
          _$_PaginationMeta value, $Res Function(_$_PaginationMeta) then) =
      __$$_PaginationMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      @JsonKey(name: 'total') int total});
}

/// @nodoc
class __$$_PaginationMetaCopyWithImpl<$Res>
    extends _$PaginationMetaCopyWithImpl<$Res, _$_PaginationMeta>
    implements _$$_PaginationMetaCopyWith<$Res> {
  __$$_PaginationMetaCopyWithImpl(
      _$_PaginationMeta _value, $Res Function(_$_PaginationMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(_$_PaginationMeta(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationMeta implements _PaginationMeta {
  const _$_PaginationMeta(
      {@JsonKey(name: 'current_page') required this.currentPage,
      @JsonKey(name: 'last_page') required this.lastPage,
      @JsonKey(name: 'per_page') required this.perPage,
      @JsonKey(name: 'total') required this.total});

  factory _$_PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationMetaFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'total')
  final int total;

  @override
  String toString() {
    return 'PaginationMeta(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationMeta &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, lastPage, perPage, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationMetaCopyWith<_$_PaginationMeta> get copyWith =>
      __$$_PaginationMetaCopyWithImpl<_$_PaginationMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationMetaToJson(
      this,
    );
  }
}

abstract class _PaginationMeta implements PaginationMeta {
  const factory _PaginationMeta(
      {@JsonKey(name: 'current_page') required final int currentPage,
      @JsonKey(name: 'last_page') required final int lastPage,
      @JsonKey(name: 'per_page') required final int perPage,
      @JsonKey(name: 'total') required final int total}) = _$_PaginationMeta;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$_PaginationMeta.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'per_page')
  int get perPage;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'total')
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationMetaCopyWith<_$_PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
