// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IssueReport _$IssueReportFromJson(Map<String, dynamic> json) {
  return _IssueReport.fromJson(json);
}

/// @nodoc
mixin _$IssueReport {
  int get personId => throw _privateConstructorUsedError;
  int get roomId => throw _privateConstructorUsedError;
  String get problemText => throw _privateConstructorUsedError;
  List<ProblemMedia> get problemMedia => throw _privateConstructorUsedError;
  int get departmentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IssueReportCopyWith<IssueReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssueReportCopyWith<$Res> {
  factory $IssueReportCopyWith(
          IssueReport value, $Res Function(IssueReport) then) =
      _$IssueReportCopyWithImpl<$Res, IssueReport>;
  @useResult
  $Res call(
      {int personId,
      int roomId,
      String problemText,
      List<ProblemMedia> problemMedia,
      int departmentId});
}

/// @nodoc
class _$IssueReportCopyWithImpl<$Res, $Val extends IssueReport>
    implements $IssueReportCopyWith<$Res> {
  _$IssueReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = null,
    Object? roomId = null,
    Object? problemText = null,
    Object? problemMedia = null,
    Object? departmentId = null,
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
      problemText: null == problemText
          ? _value.problemText
          : problemText // ignore: cast_nullable_to_non_nullable
              as String,
      problemMedia: null == problemMedia
          ? _value.problemMedia
          : problemMedia // ignore: cast_nullable_to_non_nullable
              as List<ProblemMedia>,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IssueReportImplCopyWith<$Res>
    implements $IssueReportCopyWith<$Res> {
  factory _$$IssueReportImplCopyWith(
          _$IssueReportImpl value, $Res Function(_$IssueReportImpl) then) =
      __$$IssueReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int personId,
      int roomId,
      String problemText,
      List<ProblemMedia> problemMedia,
      int departmentId});
}

/// @nodoc
class __$$IssueReportImplCopyWithImpl<$Res>
    extends _$IssueReportCopyWithImpl<$Res, _$IssueReportImpl>
    implements _$$IssueReportImplCopyWith<$Res> {
  __$$IssueReportImplCopyWithImpl(
      _$IssueReportImpl _value, $Res Function(_$IssueReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = null,
    Object? roomId = null,
    Object? problemText = null,
    Object? problemMedia = null,
    Object? departmentId = null,
  }) {
    return _then(_$IssueReportImpl(
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      problemText: null == problemText
          ? _value.problemText
          : problemText // ignore: cast_nullable_to_non_nullable
              as String,
      problemMedia: null == problemMedia
          ? _value._problemMedia
          : problemMedia // ignore: cast_nullable_to_non_nullable
              as List<ProblemMedia>,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$IssueReportImpl implements _IssueReport {
  const _$IssueReportImpl(
      {this.personId = 0,
      this.roomId = 0,
      this.problemText = '',
      final List<ProblemMedia> problemMedia = const <ProblemMedia>[],
      this.departmentId = 0})
      : _problemMedia = problemMedia;

  factory _$IssueReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$IssueReportImplFromJson(json);

  @override
  @JsonKey()
  final int personId;
  @override
  @JsonKey()
  final int roomId;
  @override
  @JsonKey()
  final String problemText;
  final List<ProblemMedia> _problemMedia;
  @override
  @JsonKey()
  List<ProblemMedia> get problemMedia {
    if (_problemMedia is EqualUnmodifiableListView) return _problemMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_problemMedia);
  }

  @override
  @JsonKey()
  final int departmentId;

  @override
  String toString() {
    return 'IssueReport(personId: $personId, roomId: $roomId, problemText: $problemText, problemMedia: $problemMedia, departmentId: $departmentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssueReportImpl &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.problemText, problemText) ||
                other.problemText == problemText) &&
            const DeepCollectionEquality()
                .equals(other._problemMedia, _problemMedia) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, personId, roomId, problemText,
      const DeepCollectionEquality().hash(_problemMedia), departmentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IssueReportImplCopyWith<_$IssueReportImpl> get copyWith =>
      __$$IssueReportImplCopyWithImpl<_$IssueReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IssueReportImplToJson(
      this,
    );
  }
}

abstract class _IssueReport implements IssueReport {
  const factory _IssueReport(
      {final int personId,
      final int roomId,
      final String problemText,
      final List<ProblemMedia> problemMedia,
      final int departmentId}) = _$IssueReportImpl;

  factory _IssueReport.fromJson(Map<String, dynamic> json) =
      _$IssueReportImpl.fromJson;

  @override
  int get personId;
  @override
  int get roomId;
  @override
  String get problemText;
  @override
  List<ProblemMedia> get problemMedia;
  @override
  int get departmentId;
  @override
  @JsonKey(ignore: true)
  _$$IssueReportImplCopyWith<_$IssueReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProblemMedia _$ProblemMediaFromJson(Map<String, dynamic> json) {
  return _ProblemMedia.fromJson(json);
}

/// @nodoc
mixin _$ProblemMedia {
  String get mediaBase64 => throw _privateConstructorUsedError;
  @MediaTypeConverter()
  MediaType get mediaType => throw _privateConstructorUsedError;
  @JsonSerializable(includeIfNull: false)
  String get mediaInBase64 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProblemMediaCopyWith<ProblemMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemMediaCopyWith<$Res> {
  factory $ProblemMediaCopyWith(
          ProblemMedia value, $Res Function(ProblemMedia) then) =
      _$ProblemMediaCopyWithImpl<$Res, ProblemMedia>;
  @useResult
  $Res call(
      {String mediaBase64,
      @MediaTypeConverter() MediaType mediaType,
      @JsonSerializable(includeIfNull: false) String mediaInBase64});
}

/// @nodoc
class _$ProblemMediaCopyWithImpl<$Res, $Val extends ProblemMedia>
    implements $ProblemMediaCopyWith<$Res> {
  _$ProblemMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaBase64 = null,
    Object? mediaType = null,
    Object? mediaInBase64 = null,
  }) {
    return _then(_value.copyWith(
      mediaBase64: null == mediaBase64
          ? _value.mediaBase64
          : mediaBase64 // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      mediaInBase64: null == mediaInBase64
          ? _value.mediaInBase64
          : mediaInBase64 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProblemMediaImplCopyWith<$Res>
    implements $ProblemMediaCopyWith<$Res> {
  factory _$$ProblemMediaImplCopyWith(
          _$ProblemMediaImpl value, $Res Function(_$ProblemMediaImpl) then) =
      __$$ProblemMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mediaBase64,
      @MediaTypeConverter() MediaType mediaType,
      @JsonSerializable(includeIfNull: false) String mediaInBase64});
}

/// @nodoc
class __$$ProblemMediaImplCopyWithImpl<$Res>
    extends _$ProblemMediaCopyWithImpl<$Res, _$ProblemMediaImpl>
    implements _$$ProblemMediaImplCopyWith<$Res> {
  __$$ProblemMediaImplCopyWithImpl(
      _$ProblemMediaImpl _value, $Res Function(_$ProblemMediaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaBase64 = null,
    Object? mediaType = null,
    Object? mediaInBase64 = null,
  }) {
    return _then(_$ProblemMediaImpl(
      mediaBase64: null == mediaBase64
          ? _value.mediaBase64
          : mediaBase64 // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      mediaInBase64: null == mediaInBase64
          ? _value.mediaInBase64
          : mediaInBase64 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$ProblemMediaImpl implements _ProblemMedia {
  const _$ProblemMediaImpl(
      {this.mediaBase64 = '',
      @MediaTypeConverter() this.mediaType = MediaType.jpg,
      @JsonSerializable(includeIfNull: false) this.mediaInBase64 = ''});

  factory _$ProblemMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProblemMediaImplFromJson(json);

  @override
  @JsonKey()
  final String mediaBase64;
  @override
  @JsonKey()
  @MediaTypeConverter()
  final MediaType mediaType;
  @override
  @JsonKey()
  @JsonSerializable(includeIfNull: false)
  final String mediaInBase64;

  @override
  String toString() {
    return 'ProblemMedia(mediaBase64: $mediaBase64, mediaType: $mediaType, mediaInBase64: $mediaInBase64)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProblemMediaImpl &&
            (identical(other.mediaBase64, mediaBase64) ||
                other.mediaBase64 == mediaBase64) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.mediaInBase64, mediaInBase64) ||
                other.mediaInBase64 == mediaInBase64));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mediaBase64, mediaType, mediaInBase64);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProblemMediaImplCopyWith<_$ProblemMediaImpl> get copyWith =>
      __$$ProblemMediaImplCopyWithImpl<_$ProblemMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProblemMediaImplToJson(
      this,
    );
  }
}

abstract class _ProblemMedia implements ProblemMedia {
  const factory _ProblemMedia(
          {final String mediaBase64,
          @MediaTypeConverter() final MediaType mediaType,
          @JsonSerializable(includeIfNull: false) final String mediaInBase64}) =
      _$ProblemMediaImpl;

  factory _ProblemMedia.fromJson(Map<String, dynamic> json) =
      _$ProblemMediaImpl.fromJson;

  @override
  String get mediaBase64;
  @override
  @MediaTypeConverter()
  MediaType get mediaType;
  @override
  @JsonSerializable(includeIfNull: false)
  String get mediaInBase64;
  @override
  @JsonKey(ignore: true)
  _$$ProblemMediaImplCopyWith<_$ProblemMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
