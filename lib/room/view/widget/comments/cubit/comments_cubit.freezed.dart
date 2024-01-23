// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommentsState {
  FetchStatus get fetchStatus => throw _privateConstructorUsedError;
  List<MessageValue> get messages => throw _privateConstructorUsedError;
  ReportCleaningProblemUpdate get reportCleaningProblemUpdate =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsStateCopyWith<CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsStateCopyWith<$Res> {
  factory $CommentsStateCopyWith(
          CommentsState value, $Res Function(CommentsState) then) =
      _$CommentsStateCopyWithImpl<$Res, CommentsState>;
  @useResult
  $Res call(
      {FetchStatus fetchStatus,
      List<MessageValue> messages,
      ReportCleaningProblemUpdate reportCleaningProblemUpdate});

  $ReportCleaningProblemUpdateCopyWith<$Res> get reportCleaningProblemUpdate;
}

/// @nodoc
class _$CommentsStateCopyWithImpl<$Res, $Val extends CommentsState>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchStatus = null,
    Object? messages = null,
    Object? reportCleaningProblemUpdate = null,
  }) {
    return _then(_value.copyWith(
      fetchStatus: null == fetchStatus
          ? _value.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageValue>,
      reportCleaningProblemUpdate: null == reportCleaningProblemUpdate
          ? _value.reportCleaningProblemUpdate
          : reportCleaningProblemUpdate // ignore: cast_nullable_to_non_nullable
              as ReportCleaningProblemUpdate,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReportCleaningProblemUpdateCopyWith<$Res> get reportCleaningProblemUpdate {
    return $ReportCleaningProblemUpdateCopyWith<$Res>(
        _value.reportCleaningProblemUpdate, (value) {
      return _then(_value.copyWith(reportCleaningProblemUpdate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentsStateImplCopyWith<$Res>
    implements $CommentsStateCopyWith<$Res> {
  factory _$$CommentsStateImplCopyWith(
          _$CommentsStateImpl value, $Res Function(_$CommentsStateImpl) then) =
      __$$CommentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FetchStatus fetchStatus,
      List<MessageValue> messages,
      ReportCleaningProblemUpdate reportCleaningProblemUpdate});

  @override
  $ReportCleaningProblemUpdateCopyWith<$Res> get reportCleaningProblemUpdate;
}

/// @nodoc
class __$$CommentsStateImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$CommentsStateImpl>
    implements _$$CommentsStateImplCopyWith<$Res> {
  __$$CommentsStateImplCopyWithImpl(
      _$CommentsStateImpl _value, $Res Function(_$CommentsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchStatus = null,
    Object? messages = null,
    Object? reportCleaningProblemUpdate = null,
  }) {
    return _then(_$CommentsStateImpl(
      fetchStatus: null == fetchStatus
          ? _value.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageValue>,
      reportCleaningProblemUpdate: null == reportCleaningProblemUpdate
          ? _value.reportCleaningProblemUpdate
          : reportCleaningProblemUpdate // ignore: cast_nullable_to_non_nullable
              as ReportCleaningProblemUpdate,
    ));
  }
}

/// @nodoc

class _$CommentsStateImpl extends _CommentsState {
  const _$CommentsStateImpl(
      {this.fetchStatus = FetchStatus.init,
      final List<MessageValue> messages = const <MessageValue>[],
      this.reportCleaningProblemUpdate = const ReportCleaningProblemUpdate()})
      : _messages = messages,
        super._();

  @override
  @JsonKey()
  final FetchStatus fetchStatus;
  final List<MessageValue> _messages;
  @override
  @JsonKey()
  List<MessageValue> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final ReportCleaningProblemUpdate reportCleaningProblemUpdate;

  @override
  String toString() {
    return 'CommentsState(fetchStatus: $fetchStatus, messages: $messages, reportCleaningProblemUpdate: $reportCleaningProblemUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsStateImpl &&
            (identical(other.fetchStatus, fetchStatus) ||
                other.fetchStatus == fetchStatus) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.reportCleaningProblemUpdate,
                    reportCleaningProblemUpdate) ||
                other.reportCleaningProblemUpdate ==
                    reportCleaningProblemUpdate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fetchStatus,
      const DeepCollectionEquality().hash(_messages),
      reportCleaningProblemUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsStateImplCopyWith<_$CommentsStateImpl> get copyWith =>
      __$$CommentsStateImplCopyWithImpl<_$CommentsStateImpl>(this, _$identity);
}

abstract class _CommentsState extends CommentsState {
  const factory _CommentsState(
          {final FetchStatus fetchStatus,
          final List<MessageValue> messages,
          final ReportCleaningProblemUpdate reportCleaningProblemUpdate}) =
      _$CommentsStateImpl;
  const _CommentsState._() : super._();

  @override
  FetchStatus get fetchStatus;
  @override
  List<MessageValue> get messages;
  @override
  ReportCleaningProblemUpdate get reportCleaningProblemUpdate;
  @override
  @JsonKey(ignore: true)
  _$$CommentsStateImplCopyWith<_$CommentsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
