// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'department_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DepartmentInfo _$DepartmentInfoFromJson(Map<String, dynamic> json) {
  return _DepartmentInfo.fromJson(json);
}

/// @nodoc
mixin _$DepartmentInfo {
  List<Department> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepartmentInfoCopyWith<DepartmentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentInfoCopyWith<$Res> {
  factory $DepartmentInfoCopyWith(
          DepartmentInfo value, $Res Function(DepartmentInfo) then) =
      _$DepartmentInfoCopyWithImpl<$Res, DepartmentInfo>;
  @useResult
  $Res call({List<Department> data});
}

/// @nodoc
class _$DepartmentInfoCopyWithImpl<$Res, $Val extends DepartmentInfo>
    implements $DepartmentInfoCopyWith<$Res> {
  _$DepartmentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Department>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepartmentInfoImplCopyWith<$Res>
    implements $DepartmentInfoCopyWith<$Res> {
  factory _$$DepartmentInfoImplCopyWith(_$DepartmentInfoImpl value,
          $Res Function(_$DepartmentInfoImpl) then) =
      __$$DepartmentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Department> data});
}

/// @nodoc
class __$$DepartmentInfoImplCopyWithImpl<$Res>
    extends _$DepartmentInfoCopyWithImpl<$Res, _$DepartmentInfoImpl>
    implements _$$DepartmentInfoImplCopyWith<$Res> {
  __$$DepartmentInfoImplCopyWithImpl(
      _$DepartmentInfoImpl _value, $Res Function(_$DepartmentInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$DepartmentInfoImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Department>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$DepartmentInfoImpl implements _DepartmentInfo {
  const _$DepartmentInfoImpl(
      {final List<Department> data = const <Department>[]})
      : _data = data;

  factory _$DepartmentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartmentInfoImplFromJson(json);

  final List<Department> _data;
  @override
  @JsonKey()
  List<Department> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'DepartmentInfo(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartmentInfoImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartmentInfoImplCopyWith<_$DepartmentInfoImpl> get copyWith =>
      __$$DepartmentInfoImplCopyWithImpl<_$DepartmentInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartmentInfoImplToJson(
      this,
    );
  }
}

abstract class _DepartmentInfo implements DepartmentInfo {
  const factory _DepartmentInfo({final List<Department> data}) =
      _$DepartmentInfoImpl;

  factory _DepartmentInfo.fromJson(Map<String, dynamic> json) =
      _$DepartmentInfoImpl.fromJson;

  @override
  List<Department> get data;
  @override
  @JsonKey(ignore: true)
  _$$DepartmentInfoImplCopyWith<_$DepartmentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Department _$DepartmentFromJson(Map<String, dynamic> json) {
  return _Department.fromJson(json);
}

/// @nodoc
mixin _$Department {
  int get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepartmentCopyWith<Department> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentCopyWith<$Res> {
  factory $DepartmentCopyWith(
          Department value, $Res Function(Department) then) =
      _$DepartmentCopyWithImpl<$Res, Department>;
  @useResult
  $Res call({int id, String fullName, String shortName});
}

/// @nodoc
class _$DepartmentCopyWithImpl<$Res, $Val extends Department>
    implements $DepartmentCopyWith<$Res> {
  _$DepartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? shortName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepartmentImplCopyWith<$Res>
    implements $DepartmentCopyWith<$Res> {
  factory _$$DepartmentImplCopyWith(
          _$DepartmentImpl value, $Res Function(_$DepartmentImpl) then) =
      __$$DepartmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String fullName, String shortName});
}

/// @nodoc
class __$$DepartmentImplCopyWithImpl<$Res>
    extends _$DepartmentCopyWithImpl<$Res, _$DepartmentImpl>
    implements _$$DepartmentImplCopyWith<$Res> {
  __$$DepartmentImplCopyWithImpl(
      _$DepartmentImpl _value, $Res Function(_$DepartmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? shortName = null,
  }) {
    return _then(_$DepartmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$DepartmentImpl extends _Department {
  const _$DepartmentImpl({this.id = 0, this.fullName = '', this.shortName = ''})
      : super._();

  factory _$DepartmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartmentImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String shortName;

  @override
  String toString() {
    return 'Department(id: $id, fullName: $fullName, shortName: $shortName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, shortName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartmentImplCopyWith<_$DepartmentImpl> get copyWith =>
      __$$DepartmentImplCopyWithImpl<_$DepartmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartmentImplToJson(
      this,
    );
  }
}

abstract class _Department extends Department {
  const factory _Department(
      {final int id,
      final String fullName,
      final String shortName}) = _$DepartmentImpl;
  const _Department._() : super._();

  factory _Department.fromJson(Map<String, dynamic> json) =
      _$DepartmentImpl.fromJson;

  @override
  int get id;
  @override
  String get fullName;
  @override
  String get shortName;
  @override
  @JsonKey(ignore: true)
  _$$DepartmentImplCopyWith<_$DepartmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
