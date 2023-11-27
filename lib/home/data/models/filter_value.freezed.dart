// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterValue {
  int get cleanStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterValueCopyWith<FilterValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterValueCopyWith<$Res> {
  factory $FilterValueCopyWith(
          FilterValue value, $Res Function(FilterValue) then) =
      _$FilterValueCopyWithImpl<$Res, FilterValue>;
  @useResult
  $Res call({int cleanStatus});
}

/// @nodoc
class _$FilterValueCopyWithImpl<$Res, $Val extends FilterValue>
    implements $FilterValueCopyWith<$Res> {
  _$FilterValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cleanStatus = null,
  }) {
    return _then(_value.copyWith(
      cleanStatus: null == cleanStatus
          ? _value.cleanStatus
          : cleanStatus // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterValueImplCopyWith<$Res>
    implements $FilterValueCopyWith<$Res> {
  factory _$$FilterValueImplCopyWith(
          _$FilterValueImpl value, $Res Function(_$FilterValueImpl) then) =
      __$$FilterValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cleanStatus});
}

/// @nodoc
class __$$FilterValueImplCopyWithImpl<$Res>
    extends _$FilterValueCopyWithImpl<$Res, _$FilterValueImpl>
    implements _$$FilterValueImplCopyWith<$Res> {
  __$$FilterValueImplCopyWithImpl(
      _$FilterValueImpl _value, $Res Function(_$FilterValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cleanStatus = null,
  }) {
    return _then(_$FilterValueImpl(
      cleanStatus: null == cleanStatus
          ? _value.cleanStatus
          : cleanStatus // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FilterValueImpl implements _FilterValue {
  const _$FilterValueImpl({this.cleanStatus = -1});

  @override
  @JsonKey()
  final int cleanStatus;

  @override
  String toString() {
    return 'FilterValue(cleanStatus: $cleanStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterValueImpl &&
            (identical(other.cleanStatus, cleanStatus) ||
                other.cleanStatus == cleanStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cleanStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterValueImplCopyWith<_$FilterValueImpl> get copyWith =>
      __$$FilterValueImplCopyWithImpl<_$FilterValueImpl>(this, _$identity);
}

abstract class _FilterValue implements FilterValue {
  const factory _FilterValue({final int cleanStatus}) = _$FilterValueImpl;

  @override
  int get cleanStatus;
  @override
  @JsonKey(ignore: true)
  _$$FilterValueImplCopyWith<_$FilterValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
