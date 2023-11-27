// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clean_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CleanStatus _$CleanStatusFromJson(Map<String, dynamic> json) {
  return _CleanStatus.fromJson(json);
}

/// @nodoc
mixin _$CleanStatus {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShortDesc')
  String get shortDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'LongDesc')
  String get longDesc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CleanStatusCopyWith<CleanStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CleanStatusCopyWith<$Res> {
  factory $CleanStatusCopyWith(
          CleanStatus value, $Res Function(CleanStatus) then) =
      _$CleanStatusCopyWithImpl<$Res, CleanStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'ShortDesc') String shortDesc,
      @JsonKey(name: 'LongDesc') String longDesc});
}

/// @nodoc
class _$CleanStatusCopyWithImpl<$Res, $Val extends CleanStatus>
    implements $CleanStatusCopyWith<$Res> {
  _$CleanStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shortDesc = null,
    Object? longDesc = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shortDesc: null == shortDesc
          ? _value.shortDesc
          : shortDesc // ignore: cast_nullable_to_non_nullable
              as String,
      longDesc: null == longDesc
          ? _value.longDesc
          : longDesc // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CleanStatusImplCopyWith<$Res>
    implements $CleanStatusCopyWith<$Res> {
  factory _$$CleanStatusImplCopyWith(
          _$CleanStatusImpl value, $Res Function(_$CleanStatusImpl) then) =
      __$$CleanStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'ShortDesc') String shortDesc,
      @JsonKey(name: 'LongDesc') String longDesc});
}

/// @nodoc
class __$$CleanStatusImplCopyWithImpl<$Res>
    extends _$CleanStatusCopyWithImpl<$Res, _$CleanStatusImpl>
    implements _$$CleanStatusImplCopyWith<$Res> {
  __$$CleanStatusImplCopyWithImpl(
      _$CleanStatusImpl _value, $Res Function(_$CleanStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shortDesc = null,
    Object? longDesc = null,
  }) {
    return _then(_$CleanStatusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shortDesc: null == shortDesc
          ? _value.shortDesc
          : shortDesc // ignore: cast_nullable_to_non_nullable
              as String,
      longDesc: null == longDesc
          ? _value.longDesc
          : longDesc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CleanStatusImpl implements _CleanStatus {
  const _$CleanStatusImpl(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'ShortDesc') required this.shortDesc,
      @JsonKey(name: 'LongDesc') required this.longDesc});

  factory _$CleanStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$CleanStatusImplFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'ShortDesc')
  final String shortDesc;
  @override
  @JsonKey(name: 'LongDesc')
  final String longDesc;

  @override
  String toString() {
    return 'CleanStatus(id: $id, shortDesc: $shortDesc, longDesc: $longDesc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CleanStatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shortDesc, shortDesc) ||
                other.shortDesc == shortDesc) &&
            (identical(other.longDesc, longDesc) ||
                other.longDesc == longDesc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, shortDesc, longDesc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CleanStatusImplCopyWith<_$CleanStatusImpl> get copyWith =>
      __$$CleanStatusImplCopyWithImpl<_$CleanStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CleanStatusImplToJson(
      this,
    );
  }
}

abstract class _CleanStatus implements CleanStatus {
  const factory _CleanStatus(
          {@JsonKey(name: 'Id') required final int id,
          @JsonKey(name: 'ShortDesc') required final String shortDesc,
          @JsonKey(name: 'LongDesc') required final String longDesc}) =
      _$CleanStatusImpl;

  factory _CleanStatus.fromJson(Map<String, dynamic> json) =
      _$CleanStatusImpl.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'ShortDesc')
  String get shortDesc;
  @override
  @JsonKey(name: 'LongDesc')
  String get longDesc;
  @override
  @JsonKey(ignore: true)
  _$$CleanStatusImplCopyWith<_$CleanStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
