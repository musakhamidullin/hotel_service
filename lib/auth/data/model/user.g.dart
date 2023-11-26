// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int,
      ownerId: json['ownerId'] as int,
      name: json['name'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      surname: json['surname'] as String? ?? '',
      guid: json['guid'] as String? ?? '',
      username: json['username'] as String? ?? '',
      role: json['role'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      position: json['position'] as String? ?? '',
      secondName: json['secondName'] as String? ?? '',
      birthdayDate: json['birthdayDate'] == null
          ? null
          : DateTime.parse(json['birthdayDate'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'name': instance.name,
      'gender': instance.gender,
      'surname': instance.surname,
      'guid': instance.guid,
      'username': instance.username,
      'role': instance.role,
      'notes': instance.notes,
      'position': instance.position,
      'secondName': instance.secondName,
      'birthdayDate': instance.birthdayDate?.toIso8601String(),
    };
