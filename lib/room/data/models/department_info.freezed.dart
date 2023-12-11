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
// required dynamic errorCode,
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

// required dynamic errorCode,
  final List<Department> _data;
// required dynamic errorCode,
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

  @override // required dynamic errorCode,
  List<Department> get data;
  @override
  @JsonKey(ignore: true)
  _$$DepartmentInfoImplCopyWith<_$DepartmentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}