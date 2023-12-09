// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VoiceValue {
  String get filePath => throw _privateConstructorUsedError;
  String get buttonId => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VoiceValueCopyWith<VoiceValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceValueCopyWith<$Res> {
  factory $VoiceValueCopyWith(
          VoiceValue value, $Res Function(VoiceValue) then) =
      _$VoiceValueCopyWithImpl<$Res, VoiceValue>;
  @useResult
  $Res call({String filePath, String buttonId, String duration});
}

/// @nodoc
class _$VoiceValueCopyWithImpl<$Res, $Val extends VoiceValue>
    implements $VoiceValueCopyWith<$Res> {
  _$VoiceValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
    Object? buttonId = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      buttonId: null == buttonId
          ? _value.buttonId
          : buttonId // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoiceValueImplCopyWith<$Res>
    implements $VoiceValueCopyWith<$Res> {
  factory _$$VoiceValueImplCopyWith(
          _$VoiceValueImpl value, $Res Function(_$VoiceValueImpl) then) =
      __$$VoiceValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String filePath, String buttonId, String duration});
}

/// @nodoc
class __$$VoiceValueImplCopyWithImpl<$Res>
    extends _$VoiceValueCopyWithImpl<$Res, _$VoiceValueImpl>
    implements _$$VoiceValueImplCopyWith<$Res> {
  __$$VoiceValueImplCopyWithImpl(
      _$VoiceValueImpl _value, $Res Function(_$VoiceValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
    Object? buttonId = null,
    Object? duration = null,
  }) {
    return _then(_$VoiceValueImpl(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      buttonId: null == buttonId
          ? _value.buttonId
          : buttonId // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VoiceValueImpl implements _VoiceValue {
  const _$VoiceValueImpl(
      {required this.filePath, this.buttonId = '', this.duration = ''});

  @override
  final String filePath;
  @override
  @JsonKey()
  final String buttonId;
  @override
  @JsonKey()
  final String duration;

  @override
  String toString() {
    return 'VoiceValue(filePath: $filePath, buttonId: $buttonId, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceValueImpl &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.buttonId, buttonId) ||
                other.buttonId == buttonId) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath, buttonId, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceValueImplCopyWith<_$VoiceValueImpl> get copyWith =>
      __$$VoiceValueImplCopyWithImpl<_$VoiceValueImpl>(this, _$identity);
}

abstract class _VoiceValue implements VoiceValue {
  const factory _VoiceValue(
      {required final String filePath,
      final String buttonId,
      final String duration}) = _$VoiceValueImpl;

  @override
  String get filePath;
  @override
  String get buttonId;
  @override
  String get duration;
  @override
  @JsonKey(ignore: true)
  _$$VoiceValueImplCopyWith<_$VoiceValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
