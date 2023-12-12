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

IssuesState _$IssuesStateFromJson(Map<String, dynamic> json) {
  return _IssuesState.fromJson(json);
}

/// @nodoc
mixin _$IssuesState {
  int get index => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  @DateSerializer()
  String get date => throw _privateConstructorUsedError;
  dynamic get isMutable => throw _privateConstructorUsedError;
  Department get department => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IssuesStateCopyWith<IssuesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssuesStateCopyWith<$Res> {
  factory $IssuesStateCopyWith(
          IssuesState value, $Res Function(IssuesState) then) =
      _$IssuesStateCopyWithImpl<$Res, IssuesState>;
  @useResult
  $Res call(
      {int index,
      List<String> images,
      String comment,
      @DateSerializer() String date,
      dynamic isMutable,
      Department department});

  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class _$IssuesStateCopyWithImpl<$Res, $Val extends IssuesState>
    implements $IssuesStateCopyWith<$Res> {
  _$IssuesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? images = null,
    Object? comment = null,
    Object? date = null,
    Object? isMutable = freezed,
    Object? department = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
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
abstract class _$$IssuesStateImplCopyWith<$Res>
    implements $IssuesStateCopyWith<$Res> {
  factory _$$IssuesStateImplCopyWith(
          _$IssuesStateImpl value, $Res Function(_$IssuesStateImpl) then) =
      __$$IssuesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int index,
      List<String> images,
      String comment,
      @DateSerializer() String date,
      dynamic isMutable,
      Department department});

  @override
  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class __$$IssuesStateImplCopyWithImpl<$Res>
    extends _$IssuesStateCopyWithImpl<$Res, _$IssuesStateImpl>
    implements _$$IssuesStateImplCopyWith<$Res> {
  __$$IssuesStateImplCopyWithImpl(
      _$IssuesStateImpl _value, $Res Function(_$IssuesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? images = null,
    Object? comment = null,
    Object? date = null,
    Object? isMutable = freezed,
    Object? department = null,
  }) {
    return _then(_$IssuesStateImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
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
class _$IssuesStateImpl implements _IssuesState {
  const _$IssuesStateImpl(
      {this.index = 0,
      final List<String> images = const <String>[],
      this.comment = '',
      @DateSerializer() this.date = '',
      this.isMutable = true,
      this.department = const Department()})
      : _images = images;

  factory _$IssuesStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$IssuesStateImplFromJson(json);

  @override
  @JsonKey()
  final int index;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
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

  @override
  String toString() {
    return 'IssuesState(index: $index, images: $images, comment: $comment, date: $date, isMutable: $isMutable, department: $department)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssuesStateImpl &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other.isMutable, isMutable) &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      index,
      const DeepCollectionEquality().hash(_images),
      comment,
      date,
      const DeepCollectionEquality().hash(isMutable),
      department);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IssuesStateImplCopyWith<_$IssuesStateImpl> get copyWith =>
      __$$IssuesStateImplCopyWithImpl<_$IssuesStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IssuesStateImplToJson(
      this,
    );
  }
}

abstract class _IssuesState implements IssuesState {
  const factory _IssuesState(
      {final int index,
      final List<String> images,
      final String comment,
      @DateSerializer() final String date,
      final dynamic isMutable,
      final Department department}) = _$IssuesStateImpl;

  factory _IssuesState.fromJson(Map<String, dynamic> json) =
      _$IssuesStateImpl.fromJson;

  @override
  int get index;
  @override
  List<String> get images;
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
  _$$IssuesStateImplCopyWith<_$IssuesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
