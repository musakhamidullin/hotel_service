// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageMessagesData _$PageMessagesDataFromJson(Map<String, dynamic> json) {
  return _PageMessagesData.fromJson(json);
}

/// @nodoc
mixin _$PageMessagesData {
  List<MessageValue> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageMessagesDataCopyWith<PageMessagesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageMessagesDataCopyWith<$Res> {
  factory $PageMessagesDataCopyWith(
          PageMessagesData value, $Res Function(PageMessagesData) then) =
      _$PageMessagesDataCopyWithImpl<$Res, PageMessagesData>;
  @useResult
  $Res call({List<MessageValue> data});
}

/// @nodoc
class _$PageMessagesDataCopyWithImpl<$Res, $Val extends PageMessagesData>
    implements $PageMessagesDataCopyWith<$Res> {
  _$PageMessagesDataCopyWithImpl(this._value, this._then);

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
              as List<MessageValue>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageMessagesDataImplCopyWith<$Res>
    implements $PageMessagesDataCopyWith<$Res> {
  factory _$$PageMessagesDataImplCopyWith(_$PageMessagesDataImpl value,
          $Res Function(_$PageMessagesDataImpl) then) =
      __$$PageMessagesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MessageValue> data});
}

/// @nodoc
class __$$PageMessagesDataImplCopyWithImpl<$Res>
    extends _$PageMessagesDataCopyWithImpl<$Res, _$PageMessagesDataImpl>
    implements _$$PageMessagesDataImplCopyWith<$Res> {
  __$$PageMessagesDataImplCopyWithImpl(_$PageMessagesDataImpl _value,
      $Res Function(_$PageMessagesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PageMessagesDataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MessageValue>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$PageMessagesDataImpl implements _PageMessagesData {
  const _$PageMessagesDataImpl(
      {final List<MessageValue> data = const <MessageValue>[]})
      : _data = data;

  factory _$PageMessagesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageMessagesDataImplFromJson(json);

  final List<MessageValue> _data;
  @override
  @JsonKey()
  List<MessageValue> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PageMessagesData(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageMessagesDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageMessagesDataImplCopyWith<_$PageMessagesDataImpl> get copyWith =>
      __$$PageMessagesDataImplCopyWithImpl<_$PageMessagesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageMessagesDataImplToJson(
      this,
    );
  }
}

abstract class _PageMessagesData implements PageMessagesData {
  const factory _PageMessagesData({final List<MessageValue> data}) =
      _$PageMessagesDataImpl;

  factory _PageMessagesData.fromJson(Map<String, dynamic> json) =
      _$PageMessagesDataImpl.fromJson;

  @override
  List<MessageValue> get data;
  @override
  @JsonKey(ignore: true)
  _$$PageMessagesDataImplCopyWith<_$PageMessagesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
