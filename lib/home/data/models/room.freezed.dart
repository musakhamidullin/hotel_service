// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
mixin _$Room {
  int get id => throw _privateConstructorUsedError;
  int get floor => throw _privateConstructorUsedError;
  int get cleanStatusId => throw _privateConstructorUsedError;
  int get cleaningType => throw _privateConstructorUsedError;
  String get roomNumber => throw _privateConstructorUsedError;
  bool get roomStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res, Room>;
  @useResult
  $Res call(
      {int id,
      int floor,
      int cleanStatusId,
      int cleaningType,
      String roomNumber,
      bool roomStatus});
}

/// @nodoc
class _$RoomCopyWithImpl<$Res, $Val extends Room>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? floor = null,
    Object? cleanStatusId = null,
    Object? cleaningType = null,
    Object? roomNumber = null,
    Object? roomStatus = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      cleanStatusId: null == cleanStatusId
          ? _value.cleanStatusId
          : cleanStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      cleaningType: null == cleaningType
          ? _value.cleaningType
          : cleaningType // ignore: cast_nullable_to_non_nullable
              as int,
      roomNumber: null == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as String,
      roomStatus: null == roomStatus
          ? _value.roomStatus
          : roomStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomImplCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$$RoomImplCopyWith(
          _$RoomImpl value, $Res Function(_$RoomImpl) then) =
      __$$RoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int floor,
      int cleanStatusId,
      int cleaningType,
      String roomNumber,
      bool roomStatus});
}

/// @nodoc
class __$$RoomImplCopyWithImpl<$Res>
    extends _$RoomCopyWithImpl<$Res, _$RoomImpl>
    implements _$$RoomImplCopyWith<$Res> {
  __$$RoomImplCopyWithImpl(_$RoomImpl _value, $Res Function(_$RoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? floor = null,
    Object? cleanStatusId = null,
    Object? cleaningType = null,
    Object? roomNumber = null,
    Object? roomStatus = null,
  }) {
    return _then(_$RoomImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      cleanStatusId: null == cleanStatusId
          ? _value.cleanStatusId
          : cleanStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      cleaningType: null == cleaningType
          ? _value.cleaningType
          : cleaningType // ignore: cast_nullable_to_non_nullable
              as int,
      roomNumber: null == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as String,
      roomStatus: null == roomStatus
          ? _value.roomStatus
          : roomStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$RoomImpl implements _Room {
  const _$RoomImpl(
      {required this.id,
      required this.floor,
      required this.cleanStatusId,
      required this.cleaningType,
      required this.roomNumber,
      required this.roomStatus});

  factory _$RoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomImplFromJson(json);

  @override
  final int id;
  @override
  final int floor;
  @override
  final int cleanStatusId;
  @override
  final int cleaningType;
  @override
  final String roomNumber;
  @override
  final bool roomStatus;

  @override
  String toString() {
    return 'Room(id: $id, floor: $floor, cleanStatusId: $cleanStatusId, cleaningType: $cleaningType, roomNumber: $roomNumber, roomStatus: $roomStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.cleanStatusId, cleanStatusId) ||
                other.cleanStatusId == cleanStatusId) &&
            (identical(other.cleaningType, cleaningType) ||
                other.cleaningType == cleaningType) &&
            (identical(other.roomNumber, roomNumber) ||
                other.roomNumber == roomNumber) &&
            (identical(other.roomStatus, roomStatus) ||
                other.roomStatus == roomStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, floor, cleanStatusId,
      cleaningType, roomNumber, roomStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      __$$RoomImplCopyWithImpl<_$RoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomImplToJson(
      this,
    );
  }
}

abstract class _Room implements Room {
  const factory _Room(
      {required final int id,
      required final int floor,
      required final int cleanStatusId,
      required final int cleaningType,
      required final String roomNumber,
      required final bool roomStatus}) = _$RoomImpl;

  factory _Room.fromJson(Map<String, dynamic> json) = _$RoomImpl.fromJson;

  @override
  int get id;
  @override
  int get floor;
  @override
  int get cleanStatusId;
  @override
  int get cleaningType;
  @override
  String get roomNumber;
  @override
  bool get roomStatus;
  @override
  @JsonKey(ignore: true)
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
