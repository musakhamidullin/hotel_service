// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterValue {
  CatalogInfo? get cleanStatus => throw _privateConstructorUsedError;
  CatalogInfo? get cleanType => throw _privateConstructorUsedError;
  RoomStatusInfo? get roomStatusInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterValueCopyWith<FilterValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterValueCopyWith<$Res> {
  factory $FilterValueCopyWith(
          FilterValue value, $Res Function(FilterValue) then) =
      _$FilterValueCopyWithImpl<$Res, FilterValue>;
  @useResult
  $Res call(
      {CatalogInfo? cleanStatus,
      CatalogInfo? cleanType,
      RoomStatusInfo? roomStatusInfo});

  $CatalogInfoCopyWith<$Res>? get cleanStatus;
  $CatalogInfoCopyWith<$Res>? get cleanType;
  $RoomStatusInfoCopyWith<$Res>? get roomStatusInfo;
}

/// @nodoc
class _$FilterValueCopyWithImpl<$Res, $Val extends FilterValue>
    implements $FilterValueCopyWith<$Res> {
  _$FilterValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cleanStatus = freezed,
    Object? cleanType = freezed,
    Object? roomStatusInfo = freezed,
  }) {
    return _then(_value.copyWith(
      cleanStatus: freezed == cleanStatus
          ? _value.cleanStatus
          : cleanStatus // ignore: cast_nullable_to_non_nullable
              as CatalogInfo?,
      cleanType: freezed == cleanType
          ? _value.cleanType
          : cleanType // ignore: cast_nullable_to_non_nullable
              as CatalogInfo?,
      roomStatusInfo: freezed == roomStatusInfo
          ? _value.roomStatusInfo
          : roomStatusInfo // ignore: cast_nullable_to_non_nullable
              as RoomStatusInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CatalogInfoCopyWith<$Res>? get cleanStatus {
    if (_value.cleanStatus == null) {
      return null;
    }

    return $CatalogInfoCopyWith<$Res>(_value.cleanStatus!, (value) {
      return _then(_value.copyWith(cleanStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CatalogInfoCopyWith<$Res>? get cleanType {
    if (_value.cleanType == null) {
      return null;
    }

    return $CatalogInfoCopyWith<$Res>(_value.cleanType!, (value) {
      return _then(_value.copyWith(cleanType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomStatusInfoCopyWith<$Res>? get roomStatusInfo {
    if (_value.roomStatusInfo == null) {
      return null;
    }

    return $RoomStatusInfoCopyWith<$Res>(_value.roomStatusInfo!, (value) {
      return _then(_value.copyWith(roomStatusInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FilterValueImplCopyWith<$Res>
    implements $FilterValueCopyWith<$Res> {
  factory _$$FilterValueImplCopyWith(
          _$FilterValueImpl value, $Res Function(_$FilterValueImpl) then) =
      __$$FilterValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CatalogInfo? cleanStatus,
      CatalogInfo? cleanType,
      RoomStatusInfo? roomStatusInfo});

  @override
  $CatalogInfoCopyWith<$Res>? get cleanStatus;
  @override
  $CatalogInfoCopyWith<$Res>? get cleanType;
  @override
  $RoomStatusInfoCopyWith<$Res>? get roomStatusInfo;
}

/// @nodoc
class __$$FilterValueImplCopyWithImpl<$Res>
    extends _$FilterValueCopyWithImpl<$Res, _$FilterValueImpl>
    implements _$$FilterValueImplCopyWith<$Res> {
  __$$FilterValueImplCopyWithImpl(
      _$FilterValueImpl _value, $Res Function(_$FilterValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cleanStatus = freezed,
    Object? cleanType = freezed,
    Object? roomStatusInfo = freezed,
  }) {
    return _then(_$FilterValueImpl(
      cleanStatus: freezed == cleanStatus
          ? _value.cleanStatus
          : cleanStatus // ignore: cast_nullable_to_non_nullable
              as CatalogInfo?,
      cleanType: freezed == cleanType
          ? _value.cleanType
          : cleanType // ignore: cast_nullable_to_non_nullable
              as CatalogInfo?,
      roomStatusInfo: freezed == roomStatusInfo
          ? _value.roomStatusInfo
          : roomStatusInfo // ignore: cast_nullable_to_non_nullable
              as RoomStatusInfo?,
    ));
  }
}

/// @nodoc

class _$FilterValueImpl extends _FilterValue {
  const _$FilterValueImpl(
      {this.cleanStatus, this.cleanType, this.roomStatusInfo})
      : super._();

  @override
  final CatalogInfo? cleanStatus;
  @override
  final CatalogInfo? cleanType;
  @override
  final RoomStatusInfo? roomStatusInfo;

  @override
  String toString() {
    return 'FilterValue(cleanStatus: $cleanStatus, cleanType: $cleanType, roomStatusInfo: $roomStatusInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterValueImpl &&
            (identical(other.cleanStatus, cleanStatus) ||
                other.cleanStatus == cleanStatus) &&
            (identical(other.cleanType, cleanType) ||
                other.cleanType == cleanType) &&
            (identical(other.roomStatusInfo, roomStatusInfo) ||
                other.roomStatusInfo == roomStatusInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, cleanStatus, cleanType, roomStatusInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterValueImplCopyWith<_$FilterValueImpl> get copyWith =>
      __$$FilterValueImplCopyWithImpl<_$FilterValueImpl>(this, _$identity);
}

abstract class _FilterValue extends FilterValue {
  const factory _FilterValue(
      {final CatalogInfo? cleanStatus,
      final CatalogInfo? cleanType,
      final RoomStatusInfo? roomStatusInfo}) = _$FilterValueImpl;
  const _FilterValue._() : super._();

  @override
  CatalogInfo? get cleanStatus;
  @override
  CatalogInfo? get cleanType;
  @override
  RoomStatusInfo? get roomStatusInfo;
  @override
  @JsonKey(ignore: true)
  _$$FilterValueImplCopyWith<_$FilterValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
