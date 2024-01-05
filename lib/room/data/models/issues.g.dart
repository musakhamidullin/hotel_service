// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IssuesModelImpl _$$IssuesModelImplFromJson(Map<String, dynamic> json) =>
    _$IssuesModelImpl(
      id: json['id'] as int? ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      audios: (json['audios'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      lastComment: json['lastComment'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      date: json['date'] == null
          ? ''
          : const DateSerializer().fromJson(json['date']),
      isMutable: json['isMutable'] as bool? ?? true,
      department: json['department'] == null
          ? const Department()
          : Department.fromJson(json['department'] as Map<String, dynamic>),
      personName: json['personName'] as String? ?? '',
      defectStatus: json['defectStatus'] == null
          ? const DefectStatus()
          : DefectStatus.fromJson(json['defectStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$IssuesModelImplToJson(_$IssuesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'audios': instance.audios,
      'lastComment': instance.lastComment,
      'comment': instance.comment,
      'date': const DateSerializer().toJson(instance.date),
      'isMutable': instance.isMutable,
      'department': instance.department,
      'personName': instance.personName,
      'defectStatus': instance.defectStatus,
    };
