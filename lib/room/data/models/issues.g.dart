// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IssuesModelImpl _$$IssuesModelImplFromJson(Map<String, dynamic> json) =>
    _$IssuesModelImpl(
      id: json['id'] as int? ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ImageModel>[],
      audios: (json['audios'] as List<dynamic>?)
              ?.map((e) => AudioModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AudioModel>[],
      lastComment: json['lastComment'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      date: json['date'] == null
          ? ''
          : const DateSerializer().fromJson(json['date']),
      isFromApi: json['isFromApi'] as bool? ?? true,
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
      'isFromApi': instance.isFromApi,
      'department': instance.department,
      'personName': instance.personName,
      'defectStatus': instance.defectStatus,
    };
