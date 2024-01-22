// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_schedule_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyScheduleState {
  FetchStatus get fetchStatus => throw _privateConstructorUsedError;
  List<TimeRegion> get schedule => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyScheduleStateCopyWith<MyScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyScheduleStateCopyWith<$Res> {
  factory $MyScheduleStateCopyWith(
          MyScheduleState value, $Res Function(MyScheduleState) then) =
      _$MyScheduleStateCopyWithImpl<$Res, MyScheduleState>;
  @useResult
  $Res call({FetchStatus fetchStatus, List<TimeRegion> schedule});
}

/// @nodoc
class _$MyScheduleStateCopyWithImpl<$Res, $Val extends MyScheduleState>
    implements $MyScheduleStateCopyWith<$Res> {
  _$MyScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchStatus = null,
    Object? schedule = null,
  }) {
    return _then(_value.copyWith(
      fetchStatus: null == fetchStatus
          ? _value.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<TimeRegion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $MyScheduleStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FetchStatus fetchStatus, List<TimeRegion> schedule});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MyScheduleStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchStatus = null,
    Object? schedule = null,
  }) {
    return _then(_$InitialImpl(
      fetchStatus: null == fetchStatus
          ? _value.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      schedule: null == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<TimeRegion>,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(
      {this.fetchStatus = FetchStatus.init,
      final List<TimeRegion> schedule = const <TimeRegion>[]})
      : _schedule = schedule,
        super._();

  @override
  @JsonKey()
  final FetchStatus fetchStatus;
  final List<TimeRegion> _schedule;
  @override
  @JsonKey()
  List<TimeRegion> get schedule {
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedule);
  }

  @override
  String toString() {
    return 'MyScheduleState(fetchStatus: $fetchStatus, schedule: $schedule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.fetchStatus, fetchStatus) ||
                other.fetchStatus == fetchStatus) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, fetchStatus, const DeepCollectionEquality().hash(_schedule));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial extends MyScheduleState {
  const factory _Initial(
      {final FetchStatus fetchStatus,
      final List<TimeRegion> schedule}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  FetchStatus get fetchStatus;
  @override
  List<TimeRegion> get schedule;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
