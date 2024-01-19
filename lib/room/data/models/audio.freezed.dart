// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AudioModel _$AudioModelFromJson(Map<String, dynamic> json) {
  return _AudioModel.fromJson(json);
}

/// @nodoc
mixin _$AudioModel {
  bool get isFromApi => throw _privateConstructorUsedError;
  String get audio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioModelCopyWith<AudioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioModelCopyWith<$Res> {
  factory $AudioModelCopyWith(
          AudioModel value, $Res Function(AudioModel) then) =
      _$AudioModelCopyWithImpl<$Res, AudioModel>;
  @useResult
  $Res call({bool isFromApi, String audio});
}

/// @nodoc
class _$AudioModelCopyWithImpl<$Res, $Val extends AudioModel>
    implements $AudioModelCopyWith<$Res> {
  _$AudioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFromApi = null,
    Object? audio = null,
  }) {
    return _then(_value.copyWith(
      isFromApi: null == isFromApi
          ? _value.isFromApi
          : isFromApi // ignore: cast_nullable_to_non_nullable
              as bool,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioModelImplCopyWith<$Res>
    implements $AudioModelCopyWith<$Res> {
  factory _$$AudioModelImplCopyWith(
          _$AudioModelImpl value, $Res Function(_$AudioModelImpl) then) =
      __$$AudioModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFromApi, String audio});
}

/// @nodoc
class __$$AudioModelImplCopyWithImpl<$Res>
    extends _$AudioModelCopyWithImpl<$Res, _$AudioModelImpl>
    implements _$$AudioModelImplCopyWith<$Res> {
  __$$AudioModelImplCopyWithImpl(
      _$AudioModelImpl _value, $Res Function(_$AudioModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFromApi = null,
    Object? audio = null,
  }) {
    return _then(_$AudioModelImpl(
      isFromApi: null == isFromApi
          ? _value.isFromApi
          : isFromApi // ignore: cast_nullable_to_non_nullable
              as bool,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioModelImpl implements _AudioModel {
  _$AudioModelImpl({this.isFromApi = false, this.audio = ''});

  factory _$AudioModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioModelImplFromJson(json);

  @override
  @JsonKey()
  final bool isFromApi;
  @override
  @JsonKey()
  final String audio;

  @override
  String toString() {
    return 'AudioModel(isFromApi: $isFromApi, audio: $audio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioModelImpl &&
            (identical(other.isFromApi, isFromApi) ||
                other.isFromApi == isFromApi) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isFromApi, audio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioModelImplCopyWith<_$AudioModelImpl> get copyWith =>
      __$$AudioModelImplCopyWithImpl<_$AudioModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioModelImplToJson(
      this,
    );
  }
}

abstract class _AudioModel implements AudioModel {
  factory _AudioModel({final bool isFromApi, final String audio}) =
      _$AudioModelImpl;

  factory _AudioModel.fromJson(Map<String, dynamic> json) =
      _$AudioModelImpl.fromJson;

  @override
  bool get isFromApi;
  @override
  String get audio;
  @override
  @JsonKey(ignore: true)
  _$$AudioModelImplCopyWith<_$AudioModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
