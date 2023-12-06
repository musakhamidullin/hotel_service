// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  FetchStatus get fetchStatus => throw _privateConstructorUsedError;
  Map<int, List<Room>> get rooms => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  FilterValue? get filterValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {FetchStatus fetchStatus,
      Map<int, List<Room>> rooms,
      String query,
      FilterValue? filterValue});

  $FilterValueCopyWith<$Res>? get filterValue;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchStatus = null,
    Object? rooms = null,
    Object? query = null,
    Object? filterValue = freezed,
  }) {
    return _then(_value.copyWith(
      fetchStatus: null == fetchStatus
          ? _value.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Room>>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      filterValue: freezed == filterValue
          ? _value.filterValue
          : filterValue // ignore: cast_nullable_to_non_nullable
              as FilterValue?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterValueCopyWith<$Res>? get filterValue {
    if (_value.filterValue == null) {
      return null;
    }

    return $FilterValueCopyWith<$Res>(_value.filterValue!, (value) {
      return _then(_value.copyWith(filterValue: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FetchStatus fetchStatus,
      Map<int, List<Room>> rooms,
      String query,
      FilterValue? filterValue});

  @override
  $FilterValueCopyWith<$Res>? get filterValue;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchStatus = null,
    Object? rooms = null,
    Object? query = null,
    Object? filterValue = freezed,
  }) {
    return _then(_$InitialImpl(
      fetchStatus: null == fetchStatus
          ? _value.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      rooms: null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Room>>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      filterValue: freezed == filterValue
          ? _value.filterValue
          : filterValue // ignore: cast_nullable_to_non_nullable
              as FilterValue?,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(
      {this.fetchStatus = FetchStatus.init,
      final Map<int, List<Room>> rooms = const <int, List<Room>>{},
      this.query = '',
      this.filterValue})
      : _rooms = rooms,
        super._();

  @override
  @JsonKey()
  final FetchStatus fetchStatus;
  final Map<int, List<Room>> _rooms;
  @override
  @JsonKey()
  Map<int, List<Room>> get rooms {
    if (_rooms is EqualUnmodifiableMapView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rooms);
  }

  @override
  @JsonKey()
  final String query;
  @override
  final FilterValue? filterValue;

  @override
  String toString() {
    return 'HomeState(fetchStatus: $fetchStatus, rooms: $rooms, query: $query, filterValue: $filterValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.fetchStatus, fetchStatus) ||
                other.fetchStatus == fetchStatus) &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.filterValue, filterValue) ||
                other.filterValue == filterValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetchStatus,
      const DeepCollectionEquality().hash(_rooms), query, filterValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial extends HomeState {
  const factory _Initial(
      {final FetchStatus fetchStatus,
      final Map<int, List<Room>> rooms,
      final String query,
      final FilterValue? filterValue}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  FetchStatus get fetchStatus;
  @override
  Map<int, List<Room>> get rooms;
  @override
  String get query;
  @override
  FilterValue? get filterValue;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
