// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'defect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Defect _$DefectFromJson(Map<String, dynamic> json) {
  return _Defect.fromJson(json);
}

/// @nodoc
mixin _$Defect {
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get createDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefectCopyWith<Defect> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefectCopyWith<$Res> {
  factory $DefectCopyWith(Defect value, $Res Function(Defect) then) =
      _$DefectCopyWithImpl<$Res, Defect>;
  @useResult
  $Res call({int id, String text, DateTime createDate});
}

/// @nodoc
class _$DefectCopyWithImpl<$Res, $Val extends Defect>
    implements $DefectCopyWith<$Res> {
  _$DefectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? createDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefectImplCopyWith<$Res> implements $DefectCopyWith<$Res> {
  factory _$$DefectImplCopyWith(
          _$DefectImpl value, $Res Function(_$DefectImpl) then) =
      __$$DefectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String text, DateTime createDate});
}

/// @nodoc
class __$$DefectImplCopyWithImpl<$Res>
    extends _$DefectCopyWithImpl<$Res, _$DefectImpl>
    implements _$$DefectImplCopyWith<$Res> {
  __$$DefectImplCopyWithImpl(
      _$DefectImpl _value, $Res Function(_$DefectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? createDate = null,
  }) {
    return _then(_$DefectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$DefectImpl implements _Defect {
  const _$DefectImpl(
      {required this.id, required this.text, required this.createDate});

  factory _$DefectImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefectImplFromJson(json);

  @override
  final int id;
  @override
  final String text;
  @override
  final DateTime createDate;

  @override
  String toString() {
    return 'Defect(id: $id, text: $text, createDate: $createDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, createDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DefectImplCopyWith<_$DefectImpl> get copyWith =>
      __$$DefectImplCopyWithImpl<_$DefectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefectImplToJson(
      this,
    );
  }
}

abstract class _Defect implements Defect {
  const factory _Defect(
      {required final int id,
      required final String text,
      required final DateTime createDate}) = _$DefectImpl;

  factory _Defect.fromJson(Map<String, dynamic> json) = _$DefectImpl.fromJson;

  @override
  int get id;
  @override
  String get text;
  @override
  DateTime get createDate;
  @override
  @JsonKey(ignore: true)
  _$$DefectImplCopyWith<_$DefectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
