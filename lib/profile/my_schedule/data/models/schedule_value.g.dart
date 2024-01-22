// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleValueImpl _$$ScheduleValueImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleValueImpl(
      startDay: DateTime.parse(json['startDay'] as String),
      endDay: DateTime.parse(json['endDay'] as String),
      startBreak: DateTime.parse(json['startBreak'] as String),
      endBreak: DateTime.parse(json['endBreak'] as String),
    );

Map<String, dynamic> _$$ScheduleValueImplToJson(_$ScheduleValueImpl instance) =>
    <String, dynamic>{
      'startDay': instance.startDay.toIso8601String(),
      'endDay': instance.endDay.toIso8601String(),
      'startBreak': instance.startBreak.toIso8601String(),
      'endBreak': instance.endBreak.toIso8601String(),
    };
