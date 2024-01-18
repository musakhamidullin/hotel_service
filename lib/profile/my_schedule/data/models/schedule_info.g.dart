// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleInfoImpl _$$ScheduleInfoImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleInfoImpl(
      breaks: (json['Breaks'] as List<dynamic>?)
          ?.map((e) => IntervalValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      workIntervals: (json['WorkIntervals'] as List<dynamic>?)
          ?.map((e) => IntervalValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      freeDays: (json['FreeDays'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$ScheduleInfoImplToJson(_$ScheduleInfoImpl instance) =>
    <String, dynamic>{
      'Breaks': instance.breaks,
      'WorkIntervals': instance.workIntervals,
      'FreeDays': instance.freeDays?.map((e) => e.toIso8601String()).toList(),
    };
