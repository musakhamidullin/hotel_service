// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_status_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoomStatusInfo _$RoomStatusInfoFromJson(Map<String, dynamic> json) {
  return _RoomStatusInfo.fromJson(json);
}

/// @nodoc
mixin _$RoomStatusInfo {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomStatusInfoCopyWith<RoomStatusInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStatusInfoCopyWith<$Res> {
  factory $RoomStatusInfoCopyWith(
          RoomStatusInfo value, $Res Function(RoomStatusInfo) then) =
      _$RoomStatusInfoCopyWithImpl<$Res, RoomStatusInfo>;
  @useResult
  $Res call({@JsonKey(name: 'id') int id, String fullName});
}

/// @nodoc
class _$RoomStatusInfoCopyWithImpl<$Res, $Val extends RoomStatusInfo>
    implements $RoomStatusInfoCopyWith<$Res> {
  _$RoomStatusInfoCopyWithImpl(this._value, this._then);

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
abstract class _$$RoomStatusInfoImplCopyWith<$Res>
    implements $RoomStatusInfoCopyWith<$Res> {
  factory _$$RoomStatusInfoImplCopyWith(_$RoomStatusInfoImpl value,
          $Res Function(_$RoomStatusInfoImpl) then) =
      __$$RoomStatusInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id') int id, String fullName});
}

/// @nodoc
class __$$RoomStatusInfoImplCopyWithImpl<$Res>
    extends _$RoomStatusInfoCopyWithImpl<$Res, _$RoomStatusInfoImpl>
    implements _$$RoomStatusInfoImplCopyWith<$Res> {
  __$$RoomStatusInfoImplCopyWithImpl(
      _$RoomStatusInfoImpl _value, $Res Function(_$RoomStatusInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
  }) {
    return _then(_$RoomStatusInfoImpl(
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
class _$RoomStatusInfoImpl implements _RoomStatusInfo {
  const _$RoomStatusInfoImpl(
      {@JsonKey(name: 'id') required this.id, required this.fullName});

  factory _$RoomStatusInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomStatusInfoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  final String fullName;

  @override
  String toString() {
    return 'RoomStatusInfo(id: $id, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomStatusInfoImpl &&
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
  _$$RoomStatusInfoImplCopyWith<_$RoomStatusInfoImpl> get copyWith =>
      __$$RoomStatusInfoImplCopyWithImpl<_$RoomStatusInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomStatusInfoImplToJson(
      this,
    );
  }
}

abstract class _RoomStatusInfo implements RoomStatusInfo {
  const factory _RoomStatusInfo(
      {@JsonKey(name: 'id') required final int id,
      required final String fullName}) = _$RoomStatusInfoImpl;

  factory _RoomStatusInfo.fromJson(Map<String, dynamic> json) =
      _$RoomStatusInfoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$RoomStatusInfoImplCopyWith<_$RoomStatusInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
