// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoomInfo _$RoomInfoFromJson(Map<String, dynamic> json) {
  return _RoomInfo.fromJson(json);
}

/// @nodoc
mixin _$RoomInfo {
  Room get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomInfoCopyWith<RoomInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomInfoCopyWith<$Res> {
  factory $RoomInfoCopyWith(RoomInfo value, $Res Function(RoomInfo) then) =
      _$RoomInfoCopyWithImpl<$Res, RoomInfo>;
  @useResult
  $Res call({Room data});

  $RoomCopyWith<$Res> get data;
}

/// @nodoc
class _$RoomInfoCopyWithImpl<$Res, $Val extends RoomInfo>
    implements $RoomInfoCopyWith<$Res> {
  _$RoomInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Room,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomCopyWith<$Res> get data {
    return $RoomCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomInfoImplCopyWith<$Res>
    implements $RoomInfoCopyWith<$Res> {
  factory _$$RoomInfoImplCopyWith(
          _$RoomInfoImpl value, $Res Function(_$RoomInfoImpl) then) =
      __$$RoomInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Room data});

  @override
  $RoomCopyWith<$Res> get data;
}

/// @nodoc
class __$$RoomInfoImplCopyWithImpl<$Res>
    extends _$RoomInfoCopyWithImpl<$Res, _$RoomInfoImpl>
    implements _$$RoomInfoImplCopyWith<$Res> {
  __$$RoomInfoImplCopyWithImpl(
      _$RoomInfoImpl _value, $Res Function(_$RoomInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$RoomInfoImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Room,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$RoomInfoImpl implements _RoomInfo {
  const _$RoomInfoImpl({required this.data});

  factory _$RoomInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomInfoImplFromJson(json);

  @override
  final Room data;

  @override
  String toString() {
    return 'RoomInfo(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomInfoImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomInfoImplCopyWith<_$RoomInfoImpl> get copyWith =>
      __$$RoomInfoImplCopyWithImpl<_$RoomInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomInfoImplToJson(
      this,
    );
  }
}

abstract class _RoomInfo implements RoomInfo {
  const factory _RoomInfo({required final Room data}) = _$RoomInfoImpl;

  factory _RoomInfo.fromJson(Map<String, dynamic> json) =
      _$RoomInfoImpl.fromJson;

  @override
  Room get data;
  @override
  @JsonKey(ignore: true)
  _$$RoomInfoImplCopyWith<_$RoomInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
