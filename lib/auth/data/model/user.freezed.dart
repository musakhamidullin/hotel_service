// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'UserId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'personInfo')
  Person get personInfo => throw _privateConstructorUsedError;
  @ImageConverter()
  Uint8List? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId') String userId,
      @JsonKey(name: 'personInfo') Person personInfo,
      @ImageConverter() Uint8List? image});

  $PersonCopyWith<$Res> get personInfo;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? personInfo = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      personInfo: null == personInfo
          ? _value.personInfo
          : personInfo // ignore: cast_nullable_to_non_nullable
              as Person,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get personInfo {
    return $PersonCopyWith<$Res>(_value.personInfo, (value) {
      return _then(_value.copyWith(personInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId') String userId,
      @JsonKey(name: 'personInfo') Person personInfo,
      @ImageConverter() Uint8List? image});

  @override
  $PersonCopyWith<$Res> get personInfo;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? personInfo = null,
    Object? image = freezed,
  }) {
    return _then(_$UserImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      personInfo: null == personInfo
          ? _value.personInfo
          : personInfo // ignore: cast_nullable_to_non_nullable
              as Person,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: 'UserId') required this.userId,
      @JsonKey(name: 'personInfo') required this.personInfo,
      @ImageConverter() this.image});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'UserId')
  final String userId;
  @override
  @JsonKey(name: 'personInfo')
  final Person personInfo;
  @override
  @ImageConverter()
  final Uint8List? image;

  @override
  String toString() {
    return 'User(userId: $userId, personInfo: $personInfo, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.personInfo, personInfo) ||
                other.personInfo == personInfo) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, personInfo,
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: 'UserId') required final String userId,
      @JsonKey(name: 'personInfo') required final Person personInfo,
      @ImageConverter() final Uint8List? image}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'UserId')
  String get userId;
  @override
  @JsonKey(name: 'personInfo')
  Person get personInfo;
  @override
  @ImageConverter()
  Uint8List? get image;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Person _$PersonFromJson(Map<String, dynamic> json) {
  return _Person.fromJson(json);
}

/// @nodoc
mixin _$Person {
  int get id => throw _privateConstructorUsedError; //todo should remove 1366
  int get ownerId => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get patronymic => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;
  @JsonKey(name: 'Phone_1')
  String get phoneOne => throw _privateConstructorUsedError;
  @JsonKey(name: 'Phone_2')
  String get phoneSecond => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res, Person>;
  @useResult
  $Res call(
      {int id,
      int ownerId,
      String firstName,
      String patronymic,
      String gender,
      DateTime? birthday,
      @JsonKey(name: 'Phone_1') String phoneOne,
      @JsonKey(name: 'Phone_2') String phoneSecond,
      String notes});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res, $Val extends Person>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? firstName = null,
    Object? patronymic = null,
    Object? gender = null,
    Object? birthday = freezed,
    Object? phoneOne = null,
    Object? phoneSecond = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: null == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneOne: null == phoneOne
          ? _value.phoneOne
          : phoneOne // ignore: cast_nullable_to_non_nullable
              as String,
      phoneSecond: null == phoneSecond
          ? _value.phoneSecond
          : phoneSecond // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonImplCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$PersonImplCopyWith(
          _$PersonImpl value, $Res Function(_$PersonImpl) then) =
      __$$PersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int ownerId,
      String firstName,
      String patronymic,
      String gender,
      DateTime? birthday,
      @JsonKey(name: 'Phone_1') String phoneOne,
      @JsonKey(name: 'Phone_2') String phoneSecond,
      String notes});
}

/// @nodoc
class __$$PersonImplCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$PersonImpl>
    implements _$$PersonImplCopyWith<$Res> {
  __$$PersonImplCopyWithImpl(
      _$PersonImpl _value, $Res Function(_$PersonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? firstName = null,
    Object? patronymic = null,
    Object? gender = null,
    Object? birthday = freezed,
    Object? phoneOne = null,
    Object? phoneSecond = null,
    Object? notes = null,
  }) {
    return _then(_$PersonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: null == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneOne: null == phoneOne
          ? _value.phoneOne
          : phoneOne // ignore: cast_nullable_to_non_nullable
              as String,
      phoneSecond: null == phoneSecond
          ? _value.phoneSecond
          : phoneSecond // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonImpl implements _Person {
  const _$PersonImpl(
      {required this.id,
      this.ownerId = 1366,
      this.firstName = '',
      this.patronymic = '',
      this.gender = '',
      this.birthday,
      @JsonKey(name: 'Phone_1') this.phoneOne = '',
      @JsonKey(name: 'Phone_2') this.phoneSecond = '',
      this.notes = ''});

  factory _$PersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonImplFromJson(json);

  @override
  final int id;
//todo should remove 1366
  @override
  @JsonKey()
  final int ownerId;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String patronymic;
  @override
  @JsonKey()
  final String gender;
  @override
  final DateTime? birthday;
  @override
  @JsonKey(name: 'Phone_1')
  final String phoneOne;
  @override
  @JsonKey(name: 'Phone_2')
  final String phoneSecond;
  @override
  @JsonKey()
  final String notes;

  @override
  String toString() {
    return 'Person(id: $id, ownerId: $ownerId, firstName: $firstName, patronymic: $patronymic, gender: $gender, birthday: $birthday, phoneOne: $phoneOne, phoneSecond: $phoneSecond, notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.patronymic, patronymic) ||
                other.patronymic == patronymic) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.phoneOne, phoneOne) ||
                other.phoneOne == phoneOne) &&
            (identical(other.phoneSecond, phoneSecond) ||
                other.phoneSecond == phoneSecond) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ownerId, firstName,
      patronymic, gender, birthday, phoneOne, phoneSecond, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      __$$PersonImplCopyWithImpl<_$PersonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonImplToJson(
      this,
    );
  }
}

abstract class _Person implements Person {
  const factory _Person(
      {required final int id,
      final int ownerId,
      final String firstName,
      final String patronymic,
      final String gender,
      final DateTime? birthday,
      @JsonKey(name: 'Phone_1') final String phoneOne,
      @JsonKey(name: 'Phone_2') final String phoneSecond,
      final String notes}) = _$PersonImpl;

  factory _Person.fromJson(Map<String, dynamic> json) = _$PersonImpl.fromJson;

  @override
  int get id;
  @override //todo should remove 1366
  int get ownerId;
  @override
  String get firstName;
  @override
  String get patronymic;
  @override
  String get gender;
  @override
  DateTime? get birthday;
  @override
  @JsonKey(name: 'Phone_1')
  String get phoneOne;
  @override
  @JsonKey(name: 'Phone_2')
  String get phoneSecond;
  @override
  String get notes;
  @override
  @JsonKey(ignore: true)
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmployeeInfo _$EmployeeInfoFromJson(Map<String, dynamic> json) {
  return _EmployeeInfo.fromJson(json);
}

/// @nodoc
mixin _$EmployeeInfo {
  String get shortName => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeInfoCopyWith<EmployeeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeInfoCopyWith<$Res> {
  factory $EmployeeInfoCopyWith(
          EmployeeInfo value, $Res Function(EmployeeInfo) then) =
      _$EmployeeInfoCopyWithImpl<$Res, EmployeeInfo>;
  @useResult
  $Res call({String shortName, String fullName, String role});
}

/// @nodoc
class _$EmployeeInfoCopyWithImpl<$Res, $Val extends EmployeeInfo>
    implements $EmployeeInfoCopyWith<$Res> {
  _$EmployeeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortName = null,
    Object? fullName = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeInfoImplCopyWith<$Res>
    implements $EmployeeInfoCopyWith<$Res> {
  factory _$$EmployeeInfoImplCopyWith(
          _$EmployeeInfoImpl value, $Res Function(_$EmployeeInfoImpl) then) =
      __$$EmployeeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String shortName, String fullName, String role});
}

/// @nodoc
class __$$EmployeeInfoImplCopyWithImpl<$Res>
    extends _$EmployeeInfoCopyWithImpl<$Res, _$EmployeeInfoImpl>
    implements _$$EmployeeInfoImplCopyWith<$Res> {
  __$$EmployeeInfoImplCopyWithImpl(
      _$EmployeeInfoImpl _value, $Res Function(_$EmployeeInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortName = null,
    Object? fullName = null,
    Object? role = null,
  }) {
    return _then(_$EmployeeInfoImpl(
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeInfoImpl implements _EmployeeInfo {
  const _$EmployeeInfoImpl(
      {this.shortName = '', this.fullName = '', this.role = ''});

  factory _$EmployeeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeInfoImplFromJson(json);

  @override
  @JsonKey()
  final String shortName;
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String role;

  @override
  String toString() {
    return 'EmployeeInfo(shortName: $shortName, fullName: $fullName, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeInfoImpl &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shortName, fullName, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeInfoImplCopyWith<_$EmployeeInfoImpl> get copyWith =>
      __$$EmployeeInfoImplCopyWithImpl<_$EmployeeInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeInfoImplToJson(
      this,
    );
  }
}

abstract class _EmployeeInfo implements EmployeeInfo {
  const factory _EmployeeInfo(
      {final String shortName,
      final String fullName,
      final String role}) = _$EmployeeInfoImpl;

  factory _EmployeeInfo.fromJson(Map<String, dynamic> json) =
      _$EmployeeInfoImpl.fromJson;

  @override
  String get shortName;
  @override
  String get fullName;
  @override
  String get role;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeInfoImplCopyWith<_$EmployeeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
