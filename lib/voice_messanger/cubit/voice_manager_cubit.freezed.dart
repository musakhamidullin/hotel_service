// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_manager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VoiceManagerState {
  bool get enableRecord => throw _privateConstructorUsedError;
  List<VoiceValue> get records => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool enableRecord, List<VoiceValue> records)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool enableRecord, List<VoiceValue> records)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool enableRecord, List<VoiceValue> records)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VoiceManagerStateCopyWith<VoiceManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceManagerStateCopyWith<$Res> {
  factory $VoiceManagerStateCopyWith(
          VoiceManagerState value, $Res Function(VoiceManagerState) then) =
      _$VoiceManagerStateCopyWithImpl<$Res, VoiceManagerState>;
  @useResult
  $Res call({bool enableRecord, List<VoiceValue> records});
}

/// @nodoc
class _$VoiceManagerStateCopyWithImpl<$Res, $Val extends VoiceManagerState>
    implements $VoiceManagerStateCopyWith<$Res> {
  _$VoiceManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableRecord = null,
    Object? records = null,
  }) {
    return _then(_value.copyWith(
      enableRecord: null == enableRecord
          ? _value.enableRecord
          : enableRecord // ignore: cast_nullable_to_non_nullable
              as bool,
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<VoiceValue>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $VoiceManagerStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enableRecord, List<VoiceValue> records});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$VoiceManagerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableRecord = null,
    Object? records = null,
  }) {
    return _then(_$InitialImpl(
      enableRecord: null == enableRecord
          ? _value.enableRecord
          : enableRecord // ignore: cast_nullable_to_non_nullable
              as bool,
      records: null == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<VoiceValue>,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(
      {this.enableRecord = false,
      final List<VoiceValue> records = const <VoiceValue>[]})
      : _records = records,
        super._();

  @override
  @JsonKey()
  final bool enableRecord;
  final List<VoiceValue> _records;
  @override
  @JsonKey()
  List<VoiceValue> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  String toString() {
    return 'VoiceManagerState.initial(enableRecord: $enableRecord, records: $records)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.enableRecord, enableRecord) ||
                other.enableRecord == enableRecord) &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, enableRecord, const DeepCollectionEquality().hash(_records));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool enableRecord, List<VoiceValue> records)
        initial,
  }) {
    return initial(enableRecord, records);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool enableRecord, List<VoiceValue> records)? initial,
  }) {
    return initial?.call(enableRecord, records);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool enableRecord, List<VoiceValue> records)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(enableRecord, records);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends VoiceManagerState {
  const factory _Initial(
      {final bool enableRecord,
      final List<VoiceValue> records}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  bool get enableRecord;
  @override
  List<VoiceValue> get records;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}