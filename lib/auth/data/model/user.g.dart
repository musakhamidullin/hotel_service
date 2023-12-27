// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: json['UserId'] as String,
      personInfo: Person.fromJson(json['personInfo'] as Map<String, dynamic>),
      image: const ImageConverter().fromJson(json['image'] as String?),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'personInfo': instance.personInfo,
      'image': _$JsonConverterToJson<String?, Uint8List>(
          instance.image, const ImageConverter().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      id: json['id'] as int,
      ownerId: json['OwnerId'] as int,
      firstName: json['FirstName'] as String? ?? '',
      lastName: json['LastName'] as String? ?? '',
      patronymic: json['Patronymic'] as String? ?? '',
      gender: json['Gender'] as String? ?? '',
      birthday: json['Birthday'] == null
          ? null
          : DateTime.parse(json['Birthday'] as String),
      phoneOne: json['Phone_1'] as String? ?? '',
      phoneSecond: json['Phone_2'] as String? ?? '',
      notes: json['Notes'] as String? ?? '',
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'OwnerId': instance.ownerId,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Patronymic': instance.patronymic,
      'Gender': instance.gender,
      'Birthday': instance.birthday?.toIso8601String(),
      'Phone_1': instance.phoneOne,
      'Phone_2': instance.phoneSecond,
      'Notes': instance.notes,
    };

_$EmployeeInfoImpl _$$EmployeeInfoImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeInfoImpl(
      shortName: json['shortName'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      role: json['role'] as String? ?? '',
    );

Map<String, dynamic> _$$EmployeeInfoImplToJson(_$EmployeeInfoImpl instance) =>
    <String, dynamic>{
      'shortName': instance.shortName,
      'fullName': instance.fullName,
      'role': instance.role,
    };
