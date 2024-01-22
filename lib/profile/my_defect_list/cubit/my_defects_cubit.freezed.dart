// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_defects_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyDefectsState {
  FetchStatus get fetchStatus => throw _privateConstructorUsedError;
  List<IssuesModel> get myDefects => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyDefectsStateCopyWith<MyDefectsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyDefectsStateCopyWith<$Res> {
  factory $MyDefectsStateCopyWith(
          MyDefectsState value, $Res Function(MyDefectsState) then) =
      _$MyDefectsStateCopyWithImpl<$Res, MyDefectsState>;
  @useResult
  $Res call({FetchStatus fetchStatus, List<IssuesModel> myDefects});
}

/// @nodoc
class _$MyDefectsStateCopyWithImpl<$Res, $Val extends MyDefectsState>
    implements $MyDefectsStateCopyWith<$Res> {
  _$MyDefectsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchStatus = null,
    Object? myDefects = null,
  }) {
    return _then(_value.copyWith(
      fetchStatus: null == fetchStatus
          ? _value.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      myDefects: null == myDefects
          ? _value.myDefects
          : myDefects // ignore: cast_nullable_to_non_nullable
              as List<IssuesModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $MyDefectsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FetchStatus fetchStatus, List<IssuesModel> myDefects});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MyDefectsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchStatus = null,
    Object? myDefects = null,
  }) {
    return _then(_$InitialImpl(
      fetchStatus: null == fetchStatus
          ? _value.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      myDefects: null == myDefects
          ? _value._myDefects
          : myDefects // ignore: cast_nullable_to_non_nullable
              as List<IssuesModel>,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(
      {this.fetchStatus = FetchStatus.init,
      final List<IssuesModel> myDefects = const <IssuesModel>[]})
      : _myDefects = myDefects,
        super._();

  @override
  @JsonKey()
  final FetchStatus fetchStatus;
  final List<IssuesModel> _myDefects;
  @override
  @JsonKey()
  List<IssuesModel> get myDefects {
    if (_myDefects is EqualUnmodifiableListView) return _myDefects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myDefects);
  }

  @override
  String toString() {
    return 'MyDefectsState(fetchStatus: $fetchStatus, myDefects: $myDefects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.fetchStatus, fetchStatus) ||
                other.fetchStatus == fetchStatus) &&
            const DeepCollectionEquality()
                .equals(other._myDefects, _myDefects));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetchStatus,
      const DeepCollectionEquality().hash(_myDefects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial extends MyDefectsState {
  const factory _Initial(
      {final FetchStatus fetchStatus,
      final List<IssuesModel> myDefects}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  FetchStatus get fetchStatus;
  @override
  List<IssuesModel> get myDefects;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
