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
  List<String> get images => throw _privateConstructorUsedError;
  List<String> get audios => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  @DateSerializer()
  String get date => throw _privateConstructorUsedError;
  dynamic get isMutable => throw _privateConstructorUsedError;
  Department get department => throw _privateConstructorUsedError;

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
      {List<String> images,
      List<String> audios,
      String comment,
      @DateSerializer() String date,
      dynamic isMutable,
      Department department});

  $DepartmentCopyWith<$Res> get department;
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
    Object? images = null,
    Object? audios = null,
    Object? comment = null,
    Object? date = null,
    Object? isMutable = freezed,
    Object? department = null,
  }) {
    return _then(_value.copyWith(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      audios: null == audios
          ? _value.audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isMutable: freezed == isMutable
          ? _value.isMutable
          : isMutable // ignore: cast_nullable_to_non_nullable
              as dynamic,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
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
      {List<String> images,
      List<String> audios,
      String comment,
      @DateSerializer() String date,
      dynamic isMutable,
      Department department});

  @override
  $DepartmentCopyWith<$Res> get department;
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
    Object? images = null,
    Object? audios = null,
    Object? comment = null,
    Object? date = null,
    Object? isMutable = freezed,
    Object? department = null,
  }) {
    return _then(_$IssuesModelImpl(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      audios: null == audios
          ? _value._audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isMutable: freezed == isMutable ? _value.isMutable! : isMutable,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IssuesModelImpl extends _IssuesModel {
  const _$IssuesModelImpl(
      {final List<String> images = const <String>[],
      final List<String> audios = const <String>[],
      this.comment = '',
      @DateSerializer() this.date = '',
      this.isMutable = true,
      this.department = const Department()})
      : _images = images,
        _audios = audios,
        super._();

  factory _$IssuesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IssuesModelImplFromJson(json);

  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
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
  final String comment;
  @override
  @JsonKey()
  @DateSerializer()
  final String date;
  @override
  @JsonKey()
  final dynamic isMutable;
  @override
  @JsonKey()
  final Department department;

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
      {final List<String> images,
      final List<String> audios,
      final String comment,
      @DateSerializer() final String date,
      final dynamic isMutable,
      final Department department}) = _$IssuesModelImpl;
  const _IssuesModel._() : super._();

  factory _IssuesModel.fromJson(Map<String, dynamic> json) =
      _$IssuesModelImpl.fromJson;

  @override
  List<String> get images;
  @override
  List<String> get audios;
  @override
  String get comment;
  @override
  @DateSerializer()
  String get date;
  @override
  dynamic get isMutable;
  @override
  Department get department;
  @override
  @JsonKey(ignore: true)
  _$$IssuesModelImplCopyWith<_$IssuesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
