// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartmentInfoImpl _$$DepartmentInfoImplFromJson(Map<String, dynamic> json) =>
    _$DepartmentInfoImpl(
      data: (json['Data'] as List<dynamic>?)
              ?.map((e) => Department.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Department>[],
    );

Map<String, dynamic> _$$DepartmentInfoImplToJson(
        _$DepartmentInfoImpl instance) =>
    <String, dynamic>{
      'Data': instance.data,
    };

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
