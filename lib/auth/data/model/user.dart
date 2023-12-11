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

@Freezed(unionValueCase: FreezedUnionCase.pascal)
class Person with _$Person {
  const factory Person({
    required int id,
    //TODO should remove 1366
    @Default(1366) int ownerId,
    @Default('') String firstName,
    @Default('') String patronymic,
    @Default('') String gender,
    DateTime? birthday,
    @JsonKey(name: 'Phone_1') @Default('') String phoneOne,
    @JsonKey(name: 'Phone_2') @Default('') String phoneSecond,
    @Default('') String notes,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
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
