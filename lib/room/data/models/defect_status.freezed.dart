// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'defect_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DefectStatusInfo _$DefectStatusInfoFromJson(Map<String, dynamic> json) {
  return _DefectStatusInfo.fromJson(json);
}

/// @nodoc
mixin _$DefectStatusInfo {
  List<DefectStatus> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefectStatusInfoCopyWith<DefectStatusInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefectStatusInfoCopyWith<$Res> {
  factory $DefectStatusInfoCopyWith(
          DefectStatusInfo value, $Res Function(DefectStatusInfo) then) =
      _$DefectStatusInfoCopyWithImpl<$Res, DefectStatusInfo>;
  @useResult
  $Res call({List<DefectStatus> data});
}

/// @nodoc
class _$DefectStatusInfoCopyWithImpl<$Res, $Val extends DefectStatusInfo>
    implements $DefectStatusInfoCopyWith<$Res> {
  _$DefectStatusInfoCopyWithImpl(this._value, this._then);

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
              as List<DefectStatus>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefectStatusInfoImplCopyWith<$Res>
    implements $DefectStatusInfoCopyWith<$Res> {
  factory _$$DefectStatusInfoImplCopyWith(_$DefectStatusInfoImpl value,
          $Res Function(_$DefectStatusInfoImpl) then) =
      __$$DefectStatusInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DefectStatus> data});
}

/// @nodoc
class __$$DefectStatusInfoImplCopyWithImpl<$Res>
    extends _$DefectStatusInfoCopyWithImpl<$Res, _$DefectStatusInfoImpl>
    implements _$$DefectStatusInfoImplCopyWith<$Res> {
  __$$DefectStatusInfoImplCopyWithImpl(_$DefectStatusInfoImpl _value,
      $Res Function(_$DefectStatusInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$DefectStatusInfoImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DefectStatus>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$DefectStatusInfoImpl implements _DefectStatusInfo {
  const _$DefectStatusInfoImpl(
      {final List<DefectStatus> data = const <DefectStatus>[]})
      : _data = data;

  factory _$DefectStatusInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefectStatusInfoImplFromJson(json);

  final List<DefectStatus> _data;
  @override
  @JsonKey()
  List<DefectStatus> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'DefectStatusInfo(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefectStatusInfoImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DefectStatusInfoImplCopyWith<_$DefectStatusInfoImpl> get copyWith =>
      __$$DefectStatusInfoImplCopyWithImpl<_$DefectStatusInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefectStatusInfoImplToJson(
      this,
    );
  }
}

abstract class _DefectStatusInfo implements DefectStatusInfo {
  const factory _DefectStatusInfo({final List<DefectStatus> data}) =
      _$DefectStatusInfoImpl;

  factory _DefectStatusInfo.fromJson(Map<String, dynamic> json) =
      _$DefectStatusInfoImpl.fromJson;

  @override
  List<DefectStatus> get data;
  @override
  @JsonKey(ignore: true)
  _$$DefectStatusInfoImplCopyWith<_$DefectStatusInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DefectStatus _$DefectStatusFromJson(Map<String, dynamic> json) {
  return _DefectStatus.fromJson(json);
}

/// @nodoc
mixin _$DefectStatus {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefectStatusCopyWith<DefectStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefectStatusCopyWith<$Res> {
  factory $DefectStatusCopyWith(
          DefectStatus value, $Res Function(DefectStatus) then) =
      _$DefectStatusCopyWithImpl<$Res, DefectStatus>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$DefectStatusCopyWithImpl<$Res, $Val extends DefectStatus>
    implements $DefectStatusCopyWith<$Res> {
  _$DefectStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefectStatusImplCopyWith<$Res>
    implements $DefectStatusCopyWith<$Res> {
  factory _$$DefectStatusImplCopyWith(
          _$DefectStatusImpl value, $Res Function(_$DefectStatusImpl) then) =
      __$$DefectStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$DefectStatusImplCopyWithImpl<$Res>
    extends _$DefectStatusCopyWithImpl<$Res, _$DefectStatusImpl>
    implements _$$DefectStatusImplCopyWith<$Res> {
  __$$DefectStatusImplCopyWithImpl(
      _$DefectStatusImpl _value, $Res Function(_$DefectStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$DefectStatusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$DefectStatusImpl implements _DefectStatus {
  const _$DefectStatusImpl({this.id = 0, this.name = ''});

  factory _$DefectStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefectStatusImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'DefectStatus(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefectStatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DefectStatusImplCopyWith<_$DefectStatusImpl> get copyWith =>
      __$$DefectStatusImplCopyWithImpl<_$DefectStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefectStatusImplToJson(
      this,
    );
  }
}

abstract class _DefectStatus implements DefectStatus {
  const factory _DefectStatus({final int id, final String name}) =
      _$DefectStatusImpl;

  factory _DefectStatus.fromJson(Map<String, dynamic> json) =
      _$DefectStatusImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$DefectStatusImplCopyWith<_$DefectStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
