// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reports _$ReportsFromJson(Map<String, dynamic> json) {
  return _Reports.fromJson(json);
}

/// @nodoc
mixin _$Reports {
  int get personId => throw _privateConstructorUsedError;
  int get roomId => throw _privateConstructorUsedError;
  List<ProblemList> get problemList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportsCopyWith<Reports> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsCopyWith<$Res> {
  factory $ReportsCopyWith(Reports value, $Res Function(Reports) then) =
      _$ReportsCopyWithImpl<$Res, Reports>;
  @useResult
  $Res call({int personId, int roomId, List<ProblemList> problemList});
}

/// @nodoc
class _$ReportsCopyWithImpl<$Res, $Val extends Reports>
    implements $ReportsCopyWith<$Res> {
  _$ReportsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = null,
    Object? roomId = null,
    Object? problemList = null,
  }) {
    return _then(_value.copyWith(
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      problemList: null == problemList
          ? _value.problemList
          : problemList // ignore: cast_nullable_to_non_nullable
              as List<ProblemList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportsImplCopyWith<$Res> implements $ReportsCopyWith<$Res> {
  factory _$$ReportsImplCopyWith(
          _$ReportsImpl value, $Res Function(_$ReportsImpl) then) =
      __$$ReportsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int personId, int roomId, List<ProblemList> problemList});
}

/// @nodoc
class __$$ReportsImplCopyWithImpl<$Res>
    extends _$ReportsCopyWithImpl<$Res, _$ReportsImpl>
    implements _$$ReportsImplCopyWith<$Res> {
  __$$ReportsImplCopyWithImpl(
      _$ReportsImpl _value, $Res Function(_$ReportsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = null,
    Object? roomId = null,
    Object? problemList = null,
  }) {
    return _then(_$ReportsImpl(
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      problemList: null == problemList
          ? _value._problemList
          : problemList // ignore: cast_nullable_to_non_nullable
              as List<ProblemList>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$ReportsImpl implements _Reports {
  const _$ReportsImpl(
      {this.personId = 0,
      this.roomId = 0,
      final List<ProblemList> problemList = const []})
      : _problemList = problemList;

  factory _$ReportsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportsImplFromJson(json);

  @override
  @JsonKey()
  final int personId;
  @override
  @JsonKey()
  final int roomId;
  final List<ProblemList> _problemList;
  @override
  @JsonKey()
  List<ProblemList> get problemList {
    if (_problemList is EqualUnmodifiableListView) return _problemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_problemList);
  }

  @override
  String toString() {
    return 'Reports(personId: $personId, roomId: $roomId, problemList: $problemList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsImpl &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            const DeepCollectionEquality()
                .equals(other._problemList, _problemList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, personId, roomId,
      const DeepCollectionEquality().hash(_problemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportsImplCopyWith<_$ReportsImpl> get copyWith =>
      __$$ReportsImplCopyWithImpl<_$ReportsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportsImplToJson(
      this,
    );
  }
}

abstract class _Reports implements Reports {
  const factory _Reports(
      {final int personId,
      final int roomId,
      final List<ProblemList> problemList}) = _$ReportsImpl;

  factory _Reports.fromJson(Map<String, dynamic> json) = _$ReportsImpl.fromJson;

  @override
  int get personId;
  @override
  int get roomId;
  @override
  List<ProblemList> get problemList;
  @override
  @JsonKey(ignore: true)
  _$$ReportsImplCopyWith<_$ReportsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProblemList _$ProblemListFromJson(Map<String, dynamic> json) {
  return _ProblemList.fromJson(json);
}

/// @nodoc
mixin _$ProblemList {
  String get problemText => throw _privateConstructorUsedError;
  int get departmentId => throw _privateConstructorUsedError;
  List<ProblemMedia> get problemMedia => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProblemListCopyWith<ProblemList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemListCopyWith<$Res> {
  factory $ProblemListCopyWith(
          ProblemList value, $Res Function(ProblemList) then) =
      _$ProblemListCopyWithImpl<$Res, ProblemList>;
  @useResult
  $Res call(
      {String problemText, int departmentId, List<ProblemMedia> problemMedia});
}

/// @nodoc
class _$ProblemListCopyWithImpl<$Res, $Val extends ProblemList>
    implements $ProblemListCopyWith<$Res> {
  _$ProblemListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problemText = null,
    Object? departmentId = null,
    Object? problemMedia = null,
  }) {
    return _then(_value.copyWith(
      problemText: null == problemText
          ? _value.problemText
          : problemText // ignore: cast_nullable_to_non_nullable
              as String,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      problemMedia: null == problemMedia
          ? _value.problemMedia
          : problemMedia // ignore: cast_nullable_to_non_nullable
              as List<ProblemMedia>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProblemListImplCopyWith<$Res>
    implements $ProblemListCopyWith<$Res> {
  factory _$$ProblemListImplCopyWith(
          _$ProblemListImpl value, $Res Function(_$ProblemListImpl) then) =
      __$$ProblemListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String problemText, int departmentId, List<ProblemMedia> problemMedia});
}

/// @nodoc
class __$$ProblemListImplCopyWithImpl<$Res>
    extends _$ProblemListCopyWithImpl<$Res, _$ProblemListImpl>
    implements _$$ProblemListImplCopyWith<$Res> {
  __$$ProblemListImplCopyWithImpl(
      _$ProblemListImpl _value, $Res Function(_$ProblemListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problemText = null,
    Object? departmentId = null,
    Object? problemMedia = null,
  }) {
    return _then(_$ProblemListImpl(
      problemText: null == problemText
          ? _value.problemText
          : problemText // ignore: cast_nullable_to_non_nullable
              as String,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      problemMedia: null == problemMedia
          ? _value._problemMedia
          : problemMedia // ignore: cast_nullable_to_non_nullable
              as List<ProblemMedia>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$ProblemListImpl implements _ProblemList {
  const _$ProblemListImpl(
      {this.problemText = '',
      this.departmentId = 0,
      final List<ProblemMedia> problemMedia = const []})
      : _problemMedia = problemMedia;

  factory _$ProblemListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProblemListImplFromJson(json);

  @override
  @JsonKey()
  final String problemText;
  @override
  @JsonKey()
  final int departmentId;
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
    return 'ProblemList(problemText: $problemText, departmentId: $departmentId, problemMedia: $problemMedia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProblemListImpl &&
            (identical(other.problemText, problemText) ||
                other.problemText == problemText) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            const DeepCollectionEquality()
                .equals(other._problemMedia, _problemMedia));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, problemText, departmentId,
      const DeepCollectionEquality().hash(_problemMedia));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProblemListImplCopyWith<_$ProblemListImpl> get copyWith =>
      __$$ProblemListImplCopyWithImpl<_$ProblemListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProblemListImplToJson(
      this,
    );
  }
}

abstract class _ProblemList implements ProblemList {
  const factory _ProblemList(
      {final String problemText,
      final int departmentId,
      final List<ProblemMedia> problemMedia}) = _$ProblemListImpl;

  factory _ProblemList.fromJson(Map<String, dynamic> json) =
      _$ProblemListImpl.fromJson;

  @override
  String get problemText;
  @override
  int get departmentId;
  @override
  List<ProblemMedia> get problemMedia;
  @override
  @JsonKey(ignore: true)
  _$$ProblemListImplCopyWith<_$ProblemListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
