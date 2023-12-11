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
