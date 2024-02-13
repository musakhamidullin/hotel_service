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

MessageValue _$MessageValueFromJson(Map<String, dynamic> json) {
  return _MessageValue.fromJson(json);
}

/// @nodoc
mixin _$MessageValue {
// @JsonKey(includeFromJson: false)
// @Default(<Uint8List>[])
// List<Uint8List> buffImages,
  @JsonKey(includeFromJson: false)
  List<String> get pathOfImages => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  List<VoiceValue> get buffAudio => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  int get personId => throw _privateConstructorUsedError;
  String get personName => throw _privateConstructorUsedError;
  bool get isEdited => throw _privateConstructorUsedError;
  List<ProblemMedia> get medias => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
  $Res call(
      {@JsonKey(includeFromJson: false) List<String> pathOfImages,
      @JsonKey(includeFromJson: false) List<VoiceValue> buffAudio,
      String text,
      DateTime? date,
      int personId,
      String personName,
      bool isEdited,
      List<ProblemMedia> medias});
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
    Object? pathOfImages = null,
    Object? buffAudio = null,
    Object? text = null,
    Object? date = freezed,
    Object? personId = null,
    Object? personName = null,
    Object? isEdited = null,
    Object? medias = null,
  }) {
    return _then(_value.copyWith(
      pathOfImages: null == pathOfImages
          ? _value.pathOfImages
          : pathOfImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      buffAudio: null == buffAudio
          ? _value.buffAudio
          : buffAudio // ignore: cast_nullable_to_non_nullable
              as List<VoiceValue>,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int,
      personName: null == personName
          ? _value.personName
          : personName // ignore: cast_nullable_to_non_nullable
              as String,
      isEdited: null == isEdited
          ? _value.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      medias: null == medias
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<ProblemMedia>,
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
  $Res call(
      {@JsonKey(includeFromJson: false) List<String> pathOfImages,
      @JsonKey(includeFromJson: false) List<VoiceValue> buffAudio,
      String text,
      DateTime? date,
      int personId,
      String personName,
      bool isEdited,
      List<ProblemMedia> medias});
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
    Object? pathOfImages = null,
    Object? buffAudio = null,
    Object? text = null,
    Object? date = freezed,
    Object? personId = null,
    Object? personName = null,
    Object? isEdited = null,
    Object? medias = null,
  }) {
    return _then(_$MessageValueImpl(
      pathOfImages: null == pathOfImages
          ? _value._pathOfImages
          : pathOfImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      buffAudio: null == buffAudio
          ? _value._buffAudio
          : buffAudio // ignore: cast_nullable_to_non_nullable
              as List<VoiceValue>,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int,
      personName: null == personName
          ? _value.personName
          : personName // ignore: cast_nullable_to_non_nullable
              as String,
      isEdited: null == isEdited
          ? _value.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      medias: null == medias
          ? _value._medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<ProblemMedia>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$MessageValueImpl extends _MessageValue {
  const _$MessageValueImpl(
      {@JsonKey(includeFromJson: false)
      final List<String> pathOfImages = const <String>[],
      @JsonKey(includeFromJson: false)
      final List<VoiceValue> buffAudio = const <VoiceValue>[],
      this.text = '',
      this.date,
      this.personId = 0,
      this.personName = '',
      this.isEdited = false,
      final List<ProblemMedia> medias = const <ProblemMedia>[]})
      : _pathOfImages = pathOfImages,
        _buffAudio = buffAudio,
        _medias = medias,
        super._();

  factory _$MessageValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageValueImplFromJson(json);

// @JsonKey(includeFromJson: false)
// @Default(<Uint8List>[])
// List<Uint8List> buffImages,
  final List<String> _pathOfImages;
// @JsonKey(includeFromJson: false)
// @Default(<Uint8List>[])
// List<Uint8List> buffImages,
  @override
  @JsonKey(includeFromJson: false)
  List<String> get pathOfImages {
    if (_pathOfImages is EqualUnmodifiableListView) return _pathOfImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pathOfImages);
  }

  final List<VoiceValue> _buffAudio;
  @override
  @JsonKey(includeFromJson: false)
  List<VoiceValue> get buffAudio {
    if (_buffAudio is EqualUnmodifiableListView) return _buffAudio;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buffAudio);
  }

  @override
  @JsonKey()
  final String text;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final int personId;
  @override
  @JsonKey()
  final String personName;
  @override
  @JsonKey()
  final bool isEdited;
  final List<ProblemMedia> _medias;
  @override
  @JsonKey()
  List<ProblemMedia> get medias {
    if (_medias is EqualUnmodifiableListView) return _medias;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medias);
  }

  @override
  String toString() {
    return 'MessageValue(pathOfImages: $pathOfImages, buffAudio: $buffAudio, text: $text, date: $date, personId: $personId, personName: $personName, isEdited: $isEdited, medias: $medias)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageValueImpl &&
            const DeepCollectionEquality()
                .equals(other._pathOfImages, _pathOfImages) &&
            const DeepCollectionEquality()
                .equals(other._buffAudio, _buffAudio) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.personName, personName) ||
                other.personName == personName) &&
            (identical(other.isEdited, isEdited) ||
                other.isEdited == isEdited) &&
            const DeepCollectionEquality().equals(other._medias, _medias));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pathOfImages),
      const DeepCollectionEquality().hash(_buffAudio),
      text,
      date,
      personId,
      personName,
      isEdited,
      const DeepCollectionEquality().hash(_medias));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageValueImplCopyWith<_$MessageValueImpl> get copyWith =>
      __$$MessageValueImplCopyWithImpl<_$MessageValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageValueImplToJson(
      this,
    );
  }
}

abstract class _MessageValue extends MessageValue {
  const factory _MessageValue(
      {@JsonKey(includeFromJson: false) final List<String> pathOfImages,
      @JsonKey(includeFromJson: false) final List<VoiceValue> buffAudio,
      final String text,
      final DateTime? date,
      final int personId,
      final String personName,
      final bool isEdited,
      final List<ProblemMedia> medias}) = _$MessageValueImpl;
  const _MessageValue._() : super._();

  factory _MessageValue.fromJson(Map<String, dynamic> json) =
      _$MessageValueImpl.fromJson;

  @override // @JsonKey(includeFromJson: false)
// @Default(<Uint8List>[])
// List<Uint8List> buffImages,
  @JsonKey(includeFromJson: false)
  List<String> get pathOfImages;
  @override
  @JsonKey(includeFromJson: false)
  List<VoiceValue> get buffAudio;
  @override
  String get text;
  @override
  DateTime? get date;
  @override
  int get personId;
  @override
  String get personName;
  @override
  bool get isEdited;
  @override
  List<ProblemMedia> get medias;
  @override
  @JsonKey(ignore: true)
  _$$MessageValueImplCopyWith<_$MessageValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
