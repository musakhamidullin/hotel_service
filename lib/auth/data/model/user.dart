import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required int ownerId,
    @Default('') String name,
    @Default('') String gender,
    @Default('') String surname,
    @Default('') String guid,
    @Default('') String username,
    @Default('') String role,
    @Default('') String notes,
    @Default('') String position,
    @Default('') String secondName,
    DateTime? birthdayDate,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
