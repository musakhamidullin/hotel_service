// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interval_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IntervalValue _$IntervalValueFromJson(Map<String, dynamic> json) {
  return _IntervalValue.fromJson(json);
}

/// @nodoc
mixin _$IntervalValue {
  DateTime? get timeStart => throw _privateConstructorUsedError;
  DateTime? get timeEnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IntervalValueCopyWith<IntervalValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntervalValueCopyWith<$Res> {
  factory $IntervalValueCopyWith(
          IntervalValue value, $Res Function(IntervalValue) then) =
      _$IntervalValueCopyWithImpl<$Res, IntervalValue>;
  @useResult
  $Res call({DateTime? timeStart, DateTime? timeEnd});
}

/// @nodoc
class _$IntervalValueCopyWithImpl<$Res, $Val extends IntervalValue>
    implements $IntervalValueCopyWith<$Res> {
  _$IntervalValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeStart = freezed,
    Object? timeEnd = freezed,
  }) {
    return _then(_value.copyWith(
      timeStart: freezed == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeEnd: freezed == timeEnd
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntervalValueImplCopyWith<$Res>
    implements $IntervalValueCopyWith<$Res> {
  factory _$$IntervalValueImplCopyWith(
          _$IntervalValueImpl value, $Res Function(_$IntervalValueImpl) then) =
      __$$IntervalValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? timeStart, DateTime? timeEnd});
}

/// @nodoc
class __$$IntervalValueImplCopyWithImpl<$Res>
    extends _$IntervalValueCopyWithImpl<$Res, _$IntervalValueImpl>
    implements _$$IntervalValueImplCopyWith<$Res> {
  __$$IntervalValueImplCopyWithImpl(
      _$IntervalValueImpl _value, $Res Function(_$IntervalValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeStart = freezed,
    Object? timeEnd = freezed,
  }) {
    return _then(_$IntervalValueImpl(
      timeStart: freezed == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeEnd: freezed == timeEnd
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$IntervalValueImpl implements _IntervalValue {
  const _$IntervalValueImpl({this.timeStart, this.timeEnd});

  factory _$IntervalValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$IntervalValueImplFromJson(json);

  @override
  final DateTime? timeStart;
  @override
  final DateTime? timeEnd;

  @override
  String toString() {
    return 'IntervalValue(timeStart: $timeStart, timeEnd: $timeEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntervalValueImpl &&
            (identical(other.timeStart, timeStart) ||
                other.timeStart == timeStart) &&
            (identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timeStart, timeEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IntervalValueImplCopyWith<_$IntervalValueImpl> get copyWith =>
      __$$IntervalValueImplCopyWithImpl<_$IntervalValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IntervalValueImplToJson(
      this,
    );
  }
}

abstract class _IntervalValue implements IntervalValue {
  const factory _IntervalValue(
      {final DateTime? timeStart,
      final DateTime? timeEnd}) = _$IntervalValueImpl;

  factory _IntervalValue.fromJson(Map<String, dynamic> json) =
      _$IntervalValueImpl.fromJson;

  @override
  DateTime? get timeStart;
  @override
  DateTime? get timeEnd;
  @override
  @JsonKey(ignore: true)
  _$$IntervalValueImplCopyWith<_$IntervalValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
