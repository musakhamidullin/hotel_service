// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatusInfo _$StatusInfoFromJson(Map<String, dynamic> json) {
  return _StatusInfo.fromJson(json);
}

/// @nodoc
mixin _$StatusInfo {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusInfoCopyWith<StatusInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusInfoCopyWith<$Res> {
  factory $StatusInfoCopyWith(
          StatusInfo value, $Res Function(StatusInfo) then) =
      _$StatusInfoCopyWithImpl<$Res, StatusInfo>;
  @useResult
  $Res call({@JsonKey(name: 'id') int id, String fullName});
}

/// @nodoc
class _$StatusInfoCopyWithImpl<$Res, $Val extends StatusInfo>
    implements $StatusInfoCopyWith<$Res> {
  _$StatusInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusInfoImplCopyWith<$Res>
    implements $StatusInfoCopyWith<$Res> {
  factory _$$StatusInfoImplCopyWith(
          _$StatusInfoImpl value, $Res Function(_$StatusInfoImpl) then) =
      __$$StatusInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id') int id, String fullName});
}

/// @nodoc
class __$$StatusInfoImplCopyWithImpl<$Res>
    extends _$StatusInfoCopyWithImpl<$Res, _$StatusInfoImpl>
    implements _$$StatusInfoImplCopyWith<$Res> {
  __$$StatusInfoImplCopyWithImpl(
      _$StatusInfoImpl _value, $Res Function(_$StatusInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
  }) {
    return _then(_$StatusInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$StatusInfoImpl implements _StatusInfo {
  const _$StatusInfoImpl(
      {@JsonKey(name: 'id') required this.id, required this.fullName});

  factory _$StatusInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusInfoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  final String fullName;

  @override
  String toString() {
    return 'StatusInfo(id: $id, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusInfoImplCopyWith<_$StatusInfoImpl> get copyWith =>
      __$$StatusInfoImplCopyWithImpl<_$StatusInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusInfoImplToJson(
      this,
    );
  }
}

abstract class _StatusInfo implements StatusInfo {
  const factory _StatusInfo(
      {@JsonKey(name: 'id') required final int id,
      required final String fullName}) = _$StatusInfoImpl;

  factory _StatusInfo.fromJson(Map<String, dynamic> json) =
      _$StatusInfoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$StatusInfoImplCopyWith<_$StatusInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
