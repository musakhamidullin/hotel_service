// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IssuesModelImpl _$$IssuesModelImplFromJson(Map<String, dynamic> json) =>
    _$IssuesModelImpl(
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      audios: (json['audios'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      comment: json['comment'] as String? ?? '',
      date: json['date'] == null
          ? ''
          : const DateSerializer().fromJson(json['date']),
      isMutable: json['isMutable'] as bool? ?? true,
      department: json['department'] == null
          ? const Department()
          : Department.fromJson(json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$IssuesModelImplToJson(_$IssuesModelImpl instance) =>
    <String, dynamic>{
      'images': instance.images,
      'audios': instance.audios,
      'comment': instance.comment,
      'date': const DateSerializer().toJson(instance.date),
      'isMutable': instance.isMutable,
      'department': instance.department,
    };
