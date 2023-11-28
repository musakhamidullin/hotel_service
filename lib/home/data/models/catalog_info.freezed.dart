// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CatalogInfo _$CatalogInfoFromJson(Map<String, dynamic> json) {
  return _CatalogInfo.fromJson(json);
}

/// @nodoc
mixin _$CatalogInfo {
  int get id => throw _privateConstructorUsedError;
  String get shortDesc => throw _privateConstructorUsedError;
  String get longDesc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatalogInfoCopyWith<CatalogInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogInfoCopyWith<$Res> {
  factory $CatalogInfoCopyWith(
          CatalogInfo value, $Res Function(CatalogInfo) then) =
      _$CatalogInfoCopyWithImpl<$Res, CatalogInfo>;
  @useResult
  $Res call({int id, String shortDesc, String longDesc});
}

/// @nodoc
class _$CatalogInfoCopyWithImpl<$Res, $Val extends CatalogInfo>
    implements $CatalogInfoCopyWith<$Res> {
  _$CatalogInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shortDesc = null,
    Object? longDesc = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shortDesc: null == shortDesc
          ? _value.shortDesc
          : shortDesc // ignore: cast_nullable_to_non_nullable
              as String,
      longDesc: null == longDesc
          ? _value.longDesc
          : longDesc // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CatalogInfoImplCopyWith<$Res>
    implements $CatalogInfoCopyWith<$Res> {
  factory _$$CatalogInfoImplCopyWith(
          _$CatalogInfoImpl value, $Res Function(_$CatalogInfoImpl) then) =
      __$$CatalogInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String shortDesc, String longDesc});
}

/// @nodoc
class __$$CatalogInfoImplCopyWithImpl<$Res>
    extends _$CatalogInfoCopyWithImpl<$Res, _$CatalogInfoImpl>
    implements _$$CatalogInfoImplCopyWith<$Res> {
  __$$CatalogInfoImplCopyWithImpl(
      _$CatalogInfoImpl _value, $Res Function(_$CatalogInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shortDesc = null,
    Object? longDesc = null,
  }) {
    return _then(_$CatalogInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shortDesc: null == shortDesc
          ? _value.shortDesc
          : shortDesc // ignore: cast_nullable_to_non_nullable
              as String,
      longDesc: null == longDesc
          ? _value.longDesc
          : longDesc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$CatalogInfoImpl implements _CatalogInfo {
  const _$CatalogInfoImpl(
      {required this.id, required this.shortDesc, required this.longDesc});

  factory _$CatalogInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatalogInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String shortDesc;
  @override
  final String longDesc;

  @override
  String toString() {
    return 'CatalogInfo(id: $id, shortDesc: $shortDesc, longDesc: $longDesc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shortDesc, shortDesc) ||
                other.shortDesc == shortDesc) &&
            (identical(other.longDesc, longDesc) ||
                other.longDesc == longDesc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, shortDesc, longDesc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogInfoImplCopyWith<_$CatalogInfoImpl> get copyWith =>
      __$$CatalogInfoImplCopyWithImpl<_$CatalogInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatalogInfoImplToJson(
      this,
    );
  }
}

abstract class _CatalogInfo implements CatalogInfo {
  const factory _CatalogInfo(
      {required final int id,
      required final String shortDesc,
      required final String longDesc}) = _$CatalogInfoImpl;

  factory _CatalogInfo.fromJson(Map<String, dynamic> json) =
      _$CatalogInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get shortDesc;
  @override
  String get longDesc;
  @override
  @JsonKey(ignore: true)
  _$$CatalogInfoImplCopyWith<_$CatalogInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
