import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_converter.dart';

part 'user.g.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'UserId') required String userId,
    @JsonKey(name: 'personInfo') required Person personInfo,
    @ImageConverter() Uint8List? image,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Person with _$Person {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory Person({
    @JsonKey(name: 'id') required int id,
    required int ownerId,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String patronymic,
    @Default('') String gender,
    DateTime? birthday,
    @JsonKey(name: 'Phone_1') @Default('') String phoneOne,
    @JsonKey(name: 'Phone_2') @Default('') String phoneSecond,
    @Default('') String notes,
  }) = _Person;

  const Person._();

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  String fullName() => '$firstName $lastName';
}

@Freezed(unionValueCase: FreezedUnionCase.pascal)
class EmployeeInfo with _$EmployeeInfo {
  const factory EmployeeInfo({
    @Default('') String shortName,
    @Default('') String fullName,
    @Default('') String role,
  }) = _EmployeeInfo;

  factory EmployeeInfo.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInfoFromJson(json);
}
