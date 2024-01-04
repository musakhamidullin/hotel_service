// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DefectImpl _$$DefectImplFromJson(Map<String, dynamic> json) => _$DefectImpl(
      id: json['Id'] as int? ?? 0,
      text: json['Text'] as String? ?? '',
      createDate: json['CreateDate'] as String? ?? '',
      hotelDefectMedias: (json['hotelDefectMedias'] as List<dynamic>?)
              ?.map((e) => ProblemMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastComment: json['LastComment'] as String? ?? '',
      commentsCount: json['CommentsCount'] as int? ?? 0,
      personId: json['PersonId'] as int? ?? 0,
      personName: json['PersonName'] as String? ?? '',
      statusId: json['StatusId'] as int? ?? 0,
      departmentId: json['DepartmentId'] as int? ?? 0,
    );

Map<String, dynamic> _$$DefectImplToJson(_$DefectImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Text': instance.text,
      'CreateDate': instance.createDate,
      'hotelDefectMedias': instance.hotelDefectMedias,
      'LastComment': instance.lastComment,
      'CommentsCount': instance.commentsCount,
      'PersonId': instance.personId,
      'PersonName': instance.personName,
      'StatusId': instance.statusId,
      'DepartmentId': instance.departmentId,
    };
