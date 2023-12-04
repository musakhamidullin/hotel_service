// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomState {
  FetchStatus get fetchStatus => throw _privateConstructorUsedError;
  List<(int, List<XFile>, String)> get issues =>
      throw _privateConstructorUsedError;
  List<String> get departments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomStateCopyWith<RoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStateCopyWith<$Res> {
  factory $RoomStateCopyWith(RoomState value, $Res Function(RoomState) then) =
      _$RoomStateCopyWithImpl<$Res, RoomState>;
  @useResult
  $Res call(
      {FetchStatus fetchStatus,
      List<(int, List<XFile>, String)> issues,
      List<String> departments});
}

/// @nodoc
class _$RoomStateCopyWithImpl<$Res, $Val extends RoomState>
    implements $RoomStateCopyWith<$Res> {
  _$RoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchStatus = null,
    Object? issues = null,
    Object? departments = null,
  }) {
    return _then(_value.copyWith(
      fetchStatus: null == fetchStatus
          ? _value.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      issues: null == issues
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as List<(int, List<XFile>, String)>,
      departments: null == departments
          ? _value.departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomStateImplCopyWith<$Res>
    implements $RoomStateCopyWith<$Res> {
  factory _$$RoomStateImplCopyWith(
          _$RoomStateImpl value, $Res Function(_$RoomStateImpl) then) =
      __$$RoomStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FetchStatus fetchStatus,
      List<(int, List<XFile>, String)> issues,
      List<String> departments});
}

/// @nodoc
class __$$RoomStateImplCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res, _$RoomStateImpl>
    implements _$$RoomStateImplCopyWith<$Res> {
  __$$RoomStateImplCopyWithImpl(
      _$RoomStateImpl _value, $Res Function(_$RoomStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchStatus = null,
    Object? issues = null,
    Object? departments = null,
  }) {
    return _then(_$RoomStateImpl(
      fetchStatus: null == fetchStatus
          ? _value.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      issues: null == issues
          ? _value._issues
          : issues // ignore: cast_nullable_to_non_nullable
              as List<(int, List<XFile>, String)>,
      departments: null == departments
          ? _value._departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$RoomStateImpl extends _RoomState {
  const _$RoomStateImpl(
      {this.fetchStatus = FetchStatus.init,
      final List<(int, List<XFile>, String)> issues = const <(
        int,
        List<XFile>,
        String
      )>[],
      final List<String> departments = const <String>[]})
      : _issues = issues,
        _departments = departments,
        super._();

  @override
  @JsonKey()
  final FetchStatus fetchStatus;
  final List<(int, List<XFile>, String)> _issues;
  @override
  @JsonKey()
  List<(int, List<XFile>, String)> get issues {
    if (_issues is EqualUnmodifiableListView) return _issues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_issues);
  }

  final List<String> _departments;
  @override
  @JsonKey()
  List<String> get departments {
    if (_departments is EqualUnmodifiableListView) return _departments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_departments);
  }

  @override
  String toString() {
    return 'RoomState(fetchStatus: $fetchStatus, issues: $issues, departments: $departments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomStateImpl &&
            (identical(other.fetchStatus, fetchStatus) ||
                other.fetchStatus == fetchStatus) &&
            const DeepCollectionEquality().equals(other._issues, _issues) &&
            const DeepCollectionEquality()
                .equals(other._departments, _departments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fetchStatus,
      const DeepCollectionEquality().hash(_issues),
      const DeepCollectionEquality().hash(_departments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomStateImplCopyWith<_$RoomStateImpl> get copyWith =>
      __$$RoomStateImplCopyWithImpl<_$RoomStateImpl>(this, _$identity);
}

abstract class _RoomState extends RoomState {
  const factory _RoomState(
      {final FetchStatus fetchStatus,
      final List<(int, List<XFile>, String)> issues,
      final List<String> departments}) = _$RoomStateImpl;
  const _RoomState._() : super._();

  @override
  FetchStatus get fetchStatus;
  @override
  List<(int, List<XFile>, String)> get issues;
  @override
  List<String> get departments;
  @override
  @JsonKey(ignore: true)
  _$$RoomStateImplCopyWith<_$RoomStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
