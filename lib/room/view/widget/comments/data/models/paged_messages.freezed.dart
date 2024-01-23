// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PagedMessages _$PagedMessagesFromJson(Map<String, dynamic> json) {
  return _PagedMessages.fromJson(json);
}

/// @nodoc
mixin _$PagedMessages {
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get defectId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PagedMessagesCopyWith<PagedMessages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedMessagesCopyWith<$Res> {
  factory $PagedMessagesCopyWith(
          PagedMessages value, $Res Function(PagedMessages) then) =
      _$PagedMessagesCopyWithImpl<$Res, PagedMessages>;
  @useResult
  $Res call({int page, int pageSize, int defectId});
}

/// @nodoc
class _$PagedMessagesCopyWithImpl<$Res, $Val extends PagedMessages>
    implements $PagedMessagesCopyWith<$Res> {
  _$PagedMessagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? defectId = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      defectId: null == defectId
          ? _value.defectId
          : defectId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagedMessagesImplCopyWith<$Res>
    implements $PagedMessagesCopyWith<$Res> {
  factory _$$PagedMessagesImplCopyWith(
          _$PagedMessagesImpl value, $Res Function(_$PagedMessagesImpl) then) =
      __$$PagedMessagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int pageSize, int defectId});
}

/// @nodoc
class __$$PagedMessagesImplCopyWithImpl<$Res>
    extends _$PagedMessagesCopyWithImpl<$Res, _$PagedMessagesImpl>
    implements _$$PagedMessagesImplCopyWith<$Res> {
  __$$PagedMessagesImplCopyWithImpl(
      _$PagedMessagesImpl _value, $Res Function(_$PagedMessagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? defectId = null,
  }) {
    return _then(_$PagedMessagesImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      defectId: null == defectId
          ? _value.defectId
          : defectId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$PagedMessagesImpl implements _PagedMessages {
  const _$PagedMessagesImpl(
      {this.page = 1, this.pageSize = 10, this.defectId = 0});

  factory _$PagedMessagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagedMessagesImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final int defectId;

  @override
  String toString() {
    return 'PagedMessages(page: $page, pageSize: $pageSize, defectId: $defectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagedMessagesImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.defectId, defectId) ||
                other.defectId == defectId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, pageSize, defectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PagedMessagesImplCopyWith<_$PagedMessagesImpl> get copyWith =>
      __$$PagedMessagesImplCopyWithImpl<_$PagedMessagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PagedMessagesImplToJson(
      this,
    );
  }
}

abstract class _PagedMessages implements PagedMessages {
  const factory _PagedMessages(
      {final int page,
      final int pageSize,
      final int defectId}) = _$PagedMessagesImpl;

  factory _PagedMessages.fromJson(Map<String, dynamic> json) =
      _$PagedMessagesImpl.fromJson;

  @override
  int get page;
  @override
  int get pageSize;
  @override
  int get defectId;
  @override
  @JsonKey(ignore: true)
  _$$PagedMessagesImplCopyWith<_$PagedMessagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
