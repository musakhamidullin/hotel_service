// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defect_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DefectStatusInfoImpl _$$DefectStatusInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$DefectStatusInfoImpl(
      data: (json['Data'] as List<dynamic>?)
              ?.map((e) => DefectStatus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DefectStatus>[],
    );

Map<String, dynamic> _$$DefectStatusInfoImplToJson(
        _$DefectStatusInfoImpl instance) =>
    <String, dynamic>{
      'Data': instance.data,
    };

_$DefectStatusImpl _$$DefectStatusImplFromJson(Map<String, dynamic> json) =>
    _$DefectStatusImpl(
      id: json['Id'] as int? ?? 0,
      name: json['Name'] as String? ?? '',
    );

Map<String, dynamic> _$$DefectStatusImplToJson(_$DefectStatusImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
    };
