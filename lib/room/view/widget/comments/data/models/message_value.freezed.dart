// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageValue {
  String? get text => throw _privateConstructorUsedError;
  List<Uint8List>? get buffImages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageValueCopyWith<MessageValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageValueCopyWith<$Res> {
  factory $MessageValueCopyWith(
          MessageValue value, $Res Function(MessageValue) then) =
      _$MessageValueCopyWithImpl<$Res, MessageValue>;
  @useResult
  $Res call({String? text, List<Uint8List>? buffImages});
}

/// @nodoc
class _$MessageValueCopyWithImpl<$Res, $Val extends MessageValue>
    implements $MessageValueCopyWith<$Res> {
  _$MessageValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? buffImages = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      buffImages: freezed == buffImages
          ? _value.buffImages
          : buffImages // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageValueImplCopyWith<$Res>
    implements $MessageValueCopyWith<$Res> {
  factory _$$MessageValueImplCopyWith(
          _$MessageValueImpl value, $Res Function(_$MessageValueImpl) then) =
      __$$MessageValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, List<Uint8List>? buffImages});
}

/// @nodoc
class __$$MessageValueImplCopyWithImpl<$Res>
    extends _$MessageValueCopyWithImpl<$Res, _$MessageValueImpl>
    implements _$$MessageValueImplCopyWith<$Res> {
  __$$MessageValueImplCopyWithImpl(
      _$MessageValueImpl _value, $Res Function(_$MessageValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? buffImages = freezed,
  }) {
    return _then(_$MessageValueImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      buffImages: freezed == buffImages
          ? _value._buffImages
          : buffImages // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>?,
    ));
  }
}

/// @nodoc

class _$MessageValueImpl extends _MessageValue {
  const _$MessageValueImpl({this.text, final List<Uint8List>? buffImages})
      : _buffImages = buffImages,
        super._();

  @override
  final String? text;
  final List<Uint8List>? _buffImages;
  @override
  List<Uint8List>? get buffImages {
    final value = _buffImages;
    if (value == null) return null;
    if (_buffImages is EqualUnmodifiableListView) return _buffImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MessageValue(text: $text, buffImages: $buffImages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageValueImpl &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._buffImages, _buffImages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, text, const DeepCollectionEquality().hash(_buffImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageValueImplCopyWith<_$MessageValueImpl> get copyWith =>
      __$$MessageValueImplCopyWithImpl<_$MessageValueImpl>(this, _$identity);
}

abstract class _MessageValue extends MessageValue {
  const factory _MessageValue(
      {final String? text,
      final List<Uint8List>? buffImages}) = _$MessageValueImpl;
  const _MessageValue._() : super._();

  @override
  String? get text;
  @override
  List<Uint8List>? get buffImages;
  @override
  @JsonKey(ignore: true)
  _$$MessageValueImplCopyWith<_$MessageValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
