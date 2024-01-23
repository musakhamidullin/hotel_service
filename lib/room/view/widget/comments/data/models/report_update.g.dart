// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportCleaningProblemUpdateImpl _$$ReportCleaningProblemUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportCleaningProblemUpdateImpl(
      personId: json['PersonId'] as int? ?? 0,
      defectId: json['DefectId'] as int? ?? 0,
      departmentId: json['DepartmentId'] as int? ?? 0,
      comment: json['Comment'] as String? ?? '',
      problemMedia: (json['ProblemMedia'] as List<dynamic>?)
              ?.map((e) => ProblemMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReportCleaningProblemUpdateImplToJson(
        _$ReportCleaningProblemUpdateImpl instance) =>
    <String, dynamic>{
      'PersonId': instance.personId,
      'DefectId': instance.defectId,
      'DepartmentId': instance.departmentId,
      'Comment': instance.comment,
      'ProblemMedia': instance.problemMedia,
    };
