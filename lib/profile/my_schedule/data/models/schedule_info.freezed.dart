// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleInfo _$ScheduleInfoFromJson(Map<String, dynamic> json) {
  return _ScheduleInfo.fromJson(json);
}

/// @nodoc
mixin _$ScheduleInfo {
  List<IntervalValue>? get breaks => throw _privateConstructorUsedError;
  List<IntervalValue>? get workIntervals => throw _privateConstructorUsedError;
  List<DateTime>? get freeDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleInfoCopyWith<ScheduleInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleInfoCopyWith<$Res> {
  factory $ScheduleInfoCopyWith(
          ScheduleInfo value, $Res Function(ScheduleInfo) then) =
      _$ScheduleInfoCopyWithImpl<$Res, ScheduleInfo>;
  @useResult
  $Res call(
      {List<IntervalValue>? breaks,
      List<IntervalValue>? workIntervals,
      List<DateTime>? freeDays});
}

/// @nodoc
class _$ScheduleInfoCopyWithImpl<$Res, $Val extends ScheduleInfo>
    implements $ScheduleInfoCopyWith<$Res> {
  _$ScheduleInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breaks = freezed,
    Object? workIntervals = freezed,
    Object? freeDays = freezed,
  }) {
    return _then(_value.copyWith(
      breaks: freezed == breaks
          ? _value.breaks
          : breaks // ignore: cast_nullable_to_non_nullable
              as List<IntervalValue>?,
      workIntervals: freezed == workIntervals
          ? _value.workIntervals
          : workIntervals // ignore: cast_nullable_to_non_nullable
              as List<IntervalValue>?,
      freeDays: freezed == freeDays
          ? _value.freeDays
          : freeDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleInfoImplCopyWith<$Res>
    implements $ScheduleInfoCopyWith<$Res> {
  factory _$$ScheduleInfoImplCopyWith(
          _$ScheduleInfoImpl value, $Res Function(_$ScheduleInfoImpl) then) =
      __$$ScheduleInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<IntervalValue>? breaks,
      List<IntervalValue>? workIntervals,
      List<DateTime>? freeDays});
}

/// @nodoc
class __$$ScheduleInfoImplCopyWithImpl<$Res>
    extends _$ScheduleInfoCopyWithImpl<$Res, _$ScheduleInfoImpl>
    implements _$$ScheduleInfoImplCopyWith<$Res> {
  __$$ScheduleInfoImplCopyWithImpl(
      _$ScheduleInfoImpl _value, $Res Function(_$ScheduleInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breaks = freezed,
    Object? workIntervals = freezed,
    Object? freeDays = freezed,
  }) {
    return _then(_$ScheduleInfoImpl(
      breaks: freezed == breaks
          ? _value._breaks
          : breaks // ignore: cast_nullable_to_non_nullable
              as List<IntervalValue>?,
      workIntervals: freezed == workIntervals
          ? _value._workIntervals
          : workIntervals // ignore: cast_nullable_to_non_nullable
              as List<IntervalValue>?,
      freeDays: freezed == freeDays
          ? _value._freeDays
          : freeDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$ScheduleInfoImpl implements _ScheduleInfo {
  const _$ScheduleInfoImpl(
      {final List<IntervalValue>? breaks,
      final List<IntervalValue>? workIntervals,
      final List<DateTime>? freeDays})
      : _breaks = breaks,
        _workIntervals = workIntervals,
        _freeDays = freeDays;

  factory _$ScheduleInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleInfoImplFromJson(json);

  final List<IntervalValue>? _breaks;
  @override
  List<IntervalValue>? get breaks {
    final value = _breaks;
    if (value == null) return null;
    if (_breaks is EqualUnmodifiableListView) return _breaks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IntervalValue>? _workIntervals;
  @override
  List<IntervalValue>? get workIntervals {
    final value = _workIntervals;
    if (value == null) return null;
    if (_workIntervals is EqualUnmodifiableListView) return _workIntervals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DateTime>? _freeDays;
  @override
  List<DateTime>? get freeDays {
    final value = _freeDays;
    if (value == null) return null;
    if (_freeDays is EqualUnmodifiableListView) return _freeDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ScheduleInfo(breaks: $breaks, workIntervals: $workIntervals, freeDays: $freeDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleInfoImpl &&
            const DeepCollectionEquality().equals(other._breaks, _breaks) &&
            const DeepCollectionEquality()
                .equals(other._workIntervals, _workIntervals) &&
            const DeepCollectionEquality().equals(other._freeDays, _freeDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_breaks),
      const DeepCollectionEquality().hash(_workIntervals),
      const DeepCollectionEquality().hash(_freeDays));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleInfoImplCopyWith<_$ScheduleInfoImpl> get copyWith =>
      __$$ScheduleInfoImplCopyWithImpl<_$ScheduleInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleInfoImplToJson(
      this,
    );
  }
}

abstract class _ScheduleInfo implements ScheduleInfo {
  const factory _ScheduleInfo(
      {final List<IntervalValue>? breaks,
      final List<IntervalValue>? workIntervals,
      final List<DateTime>? freeDays}) = _$ScheduleInfoImpl;

  factory _ScheduleInfo.fromJson(Map<String, dynamic> json) =
      _$ScheduleInfoImpl.fromJson;

  @override
  List<IntervalValue>? get breaks;
  @override
  List<IntervalValue>? get workIntervals;
  @override
  List<DateTime>? get freeDays;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleInfoImplCopyWith<_$ScheduleInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
