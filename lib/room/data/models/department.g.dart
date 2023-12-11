// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartmentImpl _$$DepartmentImplFromJson(Map<String, dynamic> json) =>
    _$DepartmentImpl(
      id: json['Id'] as int? ?? 0,
      fullName: json['FullName'] as String? ?? '',
      shortName: json['ShortName'] as String? ?? '',
    );

Map<String, dynamic> _$$DepartmentImplToJson(_$DepartmentImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'FullName': instance.fullName,
      'ShortName': instance.shortName,
    };
