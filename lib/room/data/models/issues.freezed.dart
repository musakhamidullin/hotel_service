// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issues.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IssuesModel _$IssuesModelFromJson(Map<String, dynamic> json) {
  return _IssuesModel.fromJson(json);
}

/// @nodoc
mixin _$IssuesModel {
  int get id => throw _privateConstructorUsedError;
  List<ImageModel> get images => throw _privateConstructorUsedError;
  List<String> get audios => throw _privateConstructorUsedError;
  String get lastComment => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  @DateSerializer()
  String get date => throw _privateConstructorUsedError;
  bool get isFromApi => throw _privateConstructorUsedError;
  Department get department => throw _privateConstructorUsedError;
  String get personName => throw _privateConstructorUsedError;
  DefectStatus get defectStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IssuesModelCopyWith<IssuesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssuesModelCopyWith<$Res> {
  factory $IssuesModelCopyWith(
          IssuesModel value, $Res Function(IssuesModel) then) =
      _$IssuesModelCopyWithImpl<$Res, IssuesModel>;
  @useResult
  $Res call(
      {int id,
      List<ImageModel> images,
      List<String> audios,
      String lastComment,
      String comment,
      @DateSerializer() String date,
      bool isFromApi,
      Department department,
      String personName,
      DefectStatus defectStatus});

  $DepartmentCopyWith<$Res> get department;
  $DefectStatusCopyWith<$Res> get defectStatus;
}

/// @nodoc
class _$IssuesModelCopyWithImpl<$Res, $Val extends IssuesModel>
    implements $IssuesModelCopyWith<$Res> {
  _$IssuesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? images = null,
    Object? audios = null,
    Object? lastComment = null,
    Object? comment = null,
    Object? date = null,
    Object? isFromApi = null,
    Object? department = null,
    Object? personName = null,
    Object? defectStatus = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      audios: null == audios
          ? _value.audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastComment: null == lastComment
          ? _value.lastComment
          : lastComment // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isFromApi: null == isFromApi
          ? _value.isFromApi
          : isFromApi // ignore: cast_nullable_to_non_nullable
              as bool,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      personName: null == personName
          ? _value.personName
          : personName // ignore: cast_nullable_to_non_nullable
              as String,
      defectStatus: null == defectStatus
          ? _value.defectStatus
          : defectStatus // ignore: cast_nullable_to_non_nullable
              as DefectStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DefectStatusCopyWith<$Res> get defectStatus {
    return $DefectStatusCopyWith<$Res>(_value.defectStatus, (value) {
      return _then(_value.copyWith(defectStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IssuesModelImplCopyWith<$Res>
    implements $IssuesModelCopyWith<$Res> {
  factory _$$IssuesModelImplCopyWith(
          _$IssuesModelImpl value, $Res Function(_$IssuesModelImpl) then) =
      __$$IssuesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      List<ImageModel> images,
      List<String> audios,
      String lastComment,
      String comment,
      @DateSerializer() String date,
      bool isFromApi,
      Department department,
      String personName,
      DefectStatus defectStatus});

  @override
  $DepartmentCopyWith<$Res> get department;
  @override
  $DefectStatusCopyWith<$Res> get defectStatus;
}

/// @nodoc
class __$$IssuesModelImplCopyWithImpl<$Res>
    extends _$IssuesModelCopyWithImpl<$Res, _$IssuesModelImpl>
    implements _$$IssuesModelImplCopyWith<$Res> {
  __$$IssuesModelImplCopyWithImpl(
      _$IssuesModelImpl _value, $Res Function(_$IssuesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? images = null,
    Object? audios = null,
    Object? lastComment = null,
    Object? comment = null,
    Object? date = null,
    Object? isFromApi = null,
    Object? department = null,
    Object? personName = null,
    Object? defectStatus = null,
  }) {
    return _then(_$IssuesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      audios: null == audios
          ? _value._audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastComment: null == lastComment
          ? _value.lastComment
          : lastComment // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isFromApi: null == isFromApi
          ? _value.isFromApi
          : isFromApi // ignore: cast_nullable_to_non_nullable
              as bool,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      personName: null == personName
          ? _value.personName
          : personName // ignore: cast_nullable_to_non_nullable
              as String,
      defectStatus: null == defectStatus
          ? _value.defectStatus
          : defectStatus // ignore: cast_nullable_to_non_nullable
              as DefectStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IssuesModelImpl extends _IssuesModel {
  const _$IssuesModelImpl(
      {this.id = 0,
      final List<ImageModel> images = const <ImageModel>[],
      final List<String> audios = const <String>[],
      this.lastComment = '',
      this.comment = '',
      @DateSerializer() this.date = '',
      this.isFromApi = true,
      this.department = const Department(),
      this.personName = '',
      this.defectStatus = const DefectStatus()})
      : _images = images,
        _audios = audios,
        super._();

  factory _$IssuesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IssuesModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  final List<ImageModel> _images;
  @override
  @JsonKey()
  List<ImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<String> _audios;
  @override
  @JsonKey()
  List<String> get audios {
    if (_audios is EqualUnmodifiableListView) return _audios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_audios);
  }

  @override
  @JsonKey()
  final String lastComment;
  @override
  @JsonKey()
  final String comment;
  @override
  @JsonKey()
  @DateSerializer()
  final String date;
  @override
  @JsonKey()
  final bool isFromApi;
  @override
  @JsonKey()
  final Department department;
  @override
  @JsonKey()
  final String personName;
  @override
  @JsonKey()
  final DefectStatus defectStatus;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IssuesModelImplCopyWith<_$IssuesModelImpl> get copyWith =>
      __$$IssuesModelImplCopyWithImpl<_$IssuesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IssuesModelImplToJson(
      this,
    );
  }
}

abstract class _IssuesModel extends IssuesModel {
  const factory _IssuesModel(
      {final int id,
      final List<ImageModel> images,
      final List<String> audios,
      final String lastComment,
      final String comment,
      @DateSerializer() final String date,
      final bool isFromApi,
      final Department department,
      final String personName,
      final DefectStatus defectStatus}) = _$IssuesModelImpl;
  const _IssuesModel._() : super._();

  factory _IssuesModel.fromJson(Map<String, dynamic> json) =
      _$IssuesModelImpl.fromJson;

  @override
  int get id;
  @override
  List<ImageModel> get images;
  @override
  List<String> get audios;
  @override
  String get lastComment;
  @override
  String get comment;
  @override
  @DateSerializer()
  String get date;
  @override
  bool get isFromApi;
  @override
  Department get department;
  @override
  String get personName;
  @override
  DefectStatus get defectStatus;
  @override
  @JsonKey(ignore: true)
  _$$IssuesModelImplCopyWith<_$IssuesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
