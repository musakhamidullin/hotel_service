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
  Room get room => throw _privateConstructorUsedError;
  List<IssuesState> get addedIssues => throw _privateConstructorUsedError;
  List<IssuesState> get createdIssues => throw _privateConstructorUsedError;
  List<String> get tempImages => throw _privateConstructorUsedError;
  List<Department> get departments => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  int get tabIndex => throw _privateConstructorUsedError;

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
      Room room,
      List<IssuesState> addedIssues,
      List<IssuesState> createdIssues,
      List<String> tempImages,
      List<Department> departments,
      User user,
      int tabIndex});

  $RoomCopyWith<$Res> get room;
  $UserCopyWith<$Res> get user;
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
    Object? room = null,
    Object? addedIssues = null,
    Object? createdIssues = null,
    Object? tempImages = null,
    Object? departments = null,
    Object? user = null,
    Object? tabIndex = null,
  }) {
    return _then(_value.copyWith(
      fetchStatus: null == fetchStatus
          ? _value.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Room,
      addedIssues: null == addedIssues
          ? _value.addedIssues
          : addedIssues // ignore: cast_nullable_to_non_nullable
              as List<IssuesState>,
      createdIssues: null == createdIssues
          ? _value.createdIssues
          : createdIssues // ignore: cast_nullable_to_non_nullable
              as List<IssuesState>,
      tempImages: null == tempImages
          ? _value.tempImages
          : tempImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      departments: null == departments
          ? _value.departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<Department>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomCopyWith<$Res> get room {
    return $RoomCopyWith<$Res>(_value.room, (value) {
      return _then(_value.copyWith(room: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
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
      Room room,
      List<IssuesState> addedIssues,
      List<IssuesState> createdIssues,
      List<String> tempImages,
      List<Department> departments,
      User user,
      int tabIndex});

  @override
  $RoomCopyWith<$Res> get room;
  @override
  $UserCopyWith<$Res> get user;
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
    Object? room = null,
    Object? addedIssues = null,
    Object? createdIssues = null,
    Object? tempImages = null,
    Object? departments = null,
    Object? user = null,
    Object? tabIndex = null,
  }) {
    return _then(_$RoomStateImpl(
      fetchStatus: null == fetchStatus
          ? _value.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Room,
      addedIssues: null == addedIssues
          ? _value._addedIssues
          : addedIssues // ignore: cast_nullable_to_non_nullable
              as List<IssuesState>,
      createdIssues: null == createdIssues
          ? _value._createdIssues
          : createdIssues // ignore: cast_nullable_to_non_nullable
              as List<IssuesState>,
      tempImages: null == tempImages
          ? _value._tempImages
          : tempImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      departments: null == departments
          ? _value._departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<Department>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RoomStateImpl extends _RoomState {
  const _$RoomStateImpl(
      {this.fetchStatus = FetchStatus.init,
      this.room = const Room(),
      final List<IssuesState> addedIssues = const <IssuesState>[],
      final List<IssuesState> createdIssues = const <IssuesState>[],
      final List<String> tempImages = const <String>[],
      final List<Department> departments = const <Department>[],
      this.user = const User(userId: '', personInfo: Person(id: 0)),
      this.tabIndex = 0})
      : _addedIssues = addedIssues,
        _createdIssues = createdIssues,
        _tempImages = tempImages,
        _departments = departments,
        super._();

  @override
  @JsonKey()
  final FetchStatus fetchStatus;
  @override
  @JsonKey()
  final Room room;
  final List<IssuesState> _addedIssues;
  @override
  @JsonKey()
  List<IssuesState> get addedIssues {
    if (_addedIssues is EqualUnmodifiableListView) return _addedIssues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addedIssues);
  }

  final List<IssuesState> _createdIssues;
  @override
  @JsonKey()
  List<IssuesState> get createdIssues {
    if (_createdIssues is EqualUnmodifiableListView) return _createdIssues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_createdIssues);
  }

  final List<String> _tempImages;
  @override
  @JsonKey()
  List<String> get tempImages {
    if (_tempImages is EqualUnmodifiableListView) return _tempImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tempImages);
  }

  final List<Department> _departments;
  @override
  @JsonKey()
  List<Department> get departments {
    if (_departments is EqualUnmodifiableListView) return _departments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_departments);
  }

  @override
  @JsonKey()
  final User user;
  @override
  @JsonKey()
  final int tabIndex;

  @override
  String toString() {
    return 'RoomState(fetchStatus: $fetchStatus, room: $room, addedIssues: $addedIssues, createdIssues: $createdIssues, tempImages: $tempImages, departments: $departments, user: $user, tabIndex: $tabIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomStateImpl &&
            (identical(other.fetchStatus, fetchStatus) ||
                other.fetchStatus == fetchStatus) &&
            (identical(other.room, room) || other.room == room) &&
            const DeepCollectionEquality()
                .equals(other._addedIssues, _addedIssues) &&
            const DeepCollectionEquality()
                .equals(other._createdIssues, _createdIssues) &&
            const DeepCollectionEquality()
                .equals(other._tempImages, _tempImages) &&
            const DeepCollectionEquality()
                .equals(other._departments, _departments) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fetchStatus,
      room,
      const DeepCollectionEquality().hash(_addedIssues),
      const DeepCollectionEquality().hash(_createdIssues),
      const DeepCollectionEquality().hash(_tempImages),
      const DeepCollectionEquality().hash(_departments),
      user,
      tabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomStateImplCopyWith<_$RoomStateImpl> get copyWith =>
      __$$RoomStateImplCopyWithImpl<_$RoomStateImpl>(this, _$identity);
}

abstract class _RoomState extends RoomState {
  const factory _RoomState(
      {final FetchStatus fetchStatus,
      final Room room,
      final List<IssuesState> addedIssues,
      final List<IssuesState> createdIssues,
      final List<String> tempImages,
      final List<Department> departments,
      final User user,
      final int tabIndex}) = _$RoomStateImpl;
  const _RoomState._() : super._();

  @override
  FetchStatus get fetchStatus;
  @override
  Room get room;
  @override
  List<IssuesState> get addedIssues;
  @override
  List<IssuesState> get createdIssues;
  @override
  List<String> get tempImages;
  @override
  List<Department> get departments;
  @override
  User get user;
  @override
  int get tabIndex;
  @override
  @JsonKey(ignore: true)
  _$$RoomStateImplCopyWith<_$RoomStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
