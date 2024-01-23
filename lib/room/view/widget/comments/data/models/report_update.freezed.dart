// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportCleaningProblemUpdate _$ReportCleaningProblemUpdateFromJson(
    Map<String, dynamic> json) {
  return _ReportCleaningProblemUpdate.fromJson(json);
}

/// @nodoc
mixin _$ReportCleaningProblemUpdate {
  int get personId => throw _privateConstructorUsedError;
  int get defectId => throw _privateConstructorUsedError;
  int get departmentId => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  List<ProblemMedia> get problemMedia => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCleaningProblemUpdateCopyWith<ReportCleaningProblemUpdate>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCleaningProblemUpdateCopyWith<$Res> {
  factory $ReportCleaningProblemUpdateCopyWith(
          ReportCleaningProblemUpdate value,
          $Res Function(ReportCleaningProblemUpdate) then) =
      _$ReportCleaningProblemUpdateCopyWithImpl<$Res,
          ReportCleaningProblemUpdate>;
  @useResult
  $Res call(
      {int personId,
      int defectId,
      int departmentId,
      String comment,
      List<ProblemMedia> problemMedia});
}

/// @nodoc
class _$ReportCleaningProblemUpdateCopyWithImpl<$Res,
        $Val extends ReportCleaningProblemUpdate>
    implements $ReportCleaningProblemUpdateCopyWith<$Res> {
  _$ReportCleaningProblemUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = null,
    Object? defectId = null,
    Object? departmentId = null,
    Object? comment = null,
    Object? problemMedia = null,
  }) {
    return _then(_value.copyWith(
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int,
      defectId: null == defectId
          ? _value.defectId
          : defectId // ignore: cast_nullable_to_non_nullable
              as int,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      problemMedia: null == problemMedia
          ? _value.problemMedia
          : problemMedia // ignore: cast_nullable_to_non_nullable
              as List<ProblemMedia>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportCleaningProblemUpdateImplCopyWith<$Res>
    implements $ReportCleaningProblemUpdateCopyWith<$Res> {
  factory _$$ReportCleaningProblemUpdateImplCopyWith(
          _$ReportCleaningProblemUpdateImpl value,
          $Res Function(_$ReportCleaningProblemUpdateImpl) then) =
      __$$ReportCleaningProblemUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int personId,
      int defectId,
      int departmentId,
      String comment,
      List<ProblemMedia> problemMedia});
}

/// @nodoc
class __$$ReportCleaningProblemUpdateImplCopyWithImpl<$Res>
    extends _$ReportCleaningProblemUpdateCopyWithImpl<$Res,
        _$ReportCleaningProblemUpdateImpl>
    implements _$$ReportCleaningProblemUpdateImplCopyWith<$Res> {
  __$$ReportCleaningProblemUpdateImplCopyWithImpl(
      _$ReportCleaningProblemUpdateImpl _value,
      $Res Function(_$ReportCleaningProblemUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = null,
    Object? defectId = null,
    Object? departmentId = null,
    Object? comment = null,
    Object? problemMedia = null,
  }) {
    return _then(_$ReportCleaningProblemUpdateImpl(
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int,
      defectId: null == defectId
          ? _value.defectId
          : defectId // ignore: cast_nullable_to_non_nullable
              as int,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      problemMedia: null == problemMedia
          ? _value._problemMedia
          : problemMedia // ignore: cast_nullable_to_non_nullable
              as List<ProblemMedia>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$ReportCleaningProblemUpdateImpl
    implements _ReportCleaningProblemUpdate {
  const _$ReportCleaningProblemUpdateImpl(
      {this.personId = 0,
      this.defectId = 0,
      this.departmentId = 0,
      this.comment = '',
      final List<ProblemMedia> problemMedia = const []})
      : _problemMedia = problemMedia;

  factory _$ReportCleaningProblemUpdateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReportCleaningProblemUpdateImplFromJson(json);

  @override
  @JsonKey()
  final int personId;
  @override
  @JsonKey()
  final int defectId;
  @override
  @JsonKey()
  final int departmentId;
  @override
  @JsonKey()
  final String comment;
  final List<ProblemMedia> _problemMedia;
  @override
  @JsonKey()
  List<ProblemMedia> get problemMedia {
    if (_problemMedia is EqualUnmodifiableListView) return _problemMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_problemMedia);
  }

  @override
  String toString() {
    return 'ReportCleaningProblemUpdate(personId: $personId, defectId: $defectId, departmentId: $departmentId, comment: $comment, problemMedia: $problemMedia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportCleaningProblemUpdateImpl &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.defectId, defectId) ||
                other.defectId == defectId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality()
                .equals(other._problemMedia, _problemMedia));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, personId, defectId, departmentId,
      comment, const DeepCollectionEquality().hash(_problemMedia));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportCleaningProblemUpdateImplCopyWith<_$ReportCleaningProblemUpdateImpl>
      get copyWith => __$$ReportCleaningProblemUpdateImplCopyWithImpl<
          _$ReportCleaningProblemUpdateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportCleaningProblemUpdateImplToJson(
      this,
    );
  }
}

abstract class _ReportCleaningProblemUpdate
    implements ReportCleaningProblemUpdate {
  const factory _ReportCleaningProblemUpdate(
          {final int personId,
          final int defectId,
          final int departmentId,
          final String comment,
          final List<ProblemMedia> problemMedia}) =
      _$ReportCleaningProblemUpdateImpl;

  factory _ReportCleaningProblemUpdate.fromJson(Map<String, dynamic> json) =
      _$ReportCleaningProblemUpdateImpl.fromJson;

  @override
  int get personId;
  @override
  int get defectId;
  @override
  int get departmentId;
  @override
  String get comment;
  @override
  List<ProblemMedia> get problemMedia;
  @override
  @JsonKey(ignore: true)
  _$$ReportCleaningProblemUpdateImplCopyWith<_$ReportCleaningProblemUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
