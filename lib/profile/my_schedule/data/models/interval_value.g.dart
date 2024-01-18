// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interval_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IntervalValueImpl _$$IntervalValueImplFromJson(Map<String, dynamic> json) =>
    _$IntervalValueImpl(
      timeStart: json['TimeStart'] == null
          ? null
          : DateTime.parse(json['TimeStart'] as String),
      timeEnd: json['TimeEnd'] == null
          ? null
          : DateTime.parse(json['TimeEnd'] as String),
    );

Map<String, dynamic> _$$IntervalValueImplToJson(_$IntervalValueImpl instance) =>
    <String, dynamic>{
      'TimeStart': instance.timeStart?.toIso8601String(),
      'TimeEnd': instance.timeEnd?.toIso8601String(),
    };
