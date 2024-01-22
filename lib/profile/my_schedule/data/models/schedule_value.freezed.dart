// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleValue _$ScheduleValueFromJson(Map<String, dynamic> json) {
  return _ScheduleValue.fromJson(json);
}

/// @nodoc
mixin _$ScheduleValue {
  DateTime get startDay => throw _privateConstructorUsedError;
  DateTime get endDay => throw _privateConstructorUsedError;
  DateTime get startBreak => throw _privateConstructorUsedError;
  DateTime get endBreak => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleValueCopyWith<ScheduleValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleValueCopyWith<$Res> {
  factory $ScheduleValueCopyWith(
          ScheduleValue value, $Res Function(ScheduleValue) then) =
      _$ScheduleValueCopyWithImpl<$Res, ScheduleValue>;
  @useResult
  $Res call(
      {DateTime startDay,
      DateTime endDay,
      DateTime startBreak,
      DateTime endBreak});
}

/// @nodoc
class _$ScheduleValueCopyWithImpl<$Res, $Val extends ScheduleValue>
    implements $ScheduleValueCopyWith<$Res> {
  _$ScheduleValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDay = null,
    Object? endDay = null,
    Object? startBreak = null,
    Object? endBreak = null,
  }) {
    return _then(_value.copyWith(
      startDay: null == startDay
          ? _value.startDay
          : startDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDay: null == endDay
          ? _value.endDay
          : endDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startBreak: null == startBreak
          ? _value.startBreak
          : startBreak // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endBreak: null == endBreak
          ? _value.endBreak
          : endBreak // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleValueImplCopyWith<$Res>
    implements $ScheduleValueCopyWith<$Res> {
  factory _$$ScheduleValueImplCopyWith(
          _$ScheduleValueImpl value, $Res Function(_$ScheduleValueImpl) then) =
      __$$ScheduleValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startDay,
      DateTime endDay,
      DateTime startBreak,
      DateTime endBreak});
}

/// @nodoc
class __$$ScheduleValueImplCopyWithImpl<$Res>
    extends _$ScheduleValueCopyWithImpl<$Res, _$ScheduleValueImpl>
    implements _$$ScheduleValueImplCopyWith<$Res> {
  __$$ScheduleValueImplCopyWithImpl(
      _$ScheduleValueImpl _value, $Res Function(_$ScheduleValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDay = null,
    Object? endDay = null,
    Object? startBreak = null,
    Object? endBreak = null,
  }) {
    return _then(_$ScheduleValueImpl(
      startDay: null == startDay
          ? _value.startDay
          : startDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDay: null == endDay
          ? _value.endDay
          : endDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startBreak: null == startBreak
          ? _value.startBreak
          : startBreak // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endBreak: null == endBreak
          ? _value.endBreak
          : endBreak // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleValueImpl implements _ScheduleValue {
  const _$ScheduleValueImpl(
      {required this.startDay,
      required this.endDay,
      required this.startBreak,
      required this.endBreak});

  factory _$ScheduleValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleValueImplFromJson(json);

  @override
  final DateTime startDay;
  @override
  final DateTime endDay;
  @override
  final DateTime startBreak;
  @override
  final DateTime endBreak;

  @override
  String toString() {
    return 'ScheduleValue(startDay: $startDay, endDay: $endDay, startBreak: $startBreak, endBreak: $endBreak)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleValueImpl &&
            (identical(other.startDay, startDay) ||
                other.startDay == startDay) &&
            (identical(other.endDay, endDay) || other.endDay == endDay) &&
            (identical(other.startBreak, startBreak) ||
                other.startBreak == startBreak) &&
            (identical(other.endBreak, endBreak) ||
                other.endBreak == endBreak));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startDay, endDay, startBreak, endBreak);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleValueImplCopyWith<_$ScheduleValueImpl> get copyWith =>
      __$$ScheduleValueImplCopyWithImpl<_$ScheduleValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleValueImplToJson(
      this,
    );
  }
}

abstract class _ScheduleValue implements ScheduleValue {
  const factory _ScheduleValue(
      {required final DateTime startDay,
      required final DateTime endDay,
      required final DateTime startBreak,
      required final DateTime endBreak}) = _$ScheduleValueImpl;

  factory _ScheduleValue.fromJson(Map<String, dynamic> json) =
      _$ScheduleValueImpl.fromJson;

  @override
  DateTime get startDay;
  @override
  DateTime get endDay;
  @override
  DateTime get startBreak;
  @override
  DateTime get endBreak;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleValueImplCopyWith<_$ScheduleValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
