// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_created_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IssueCreatedReportImpl _$$IssueCreatedReportImplFromJson(
        Map<String, dynamic> json) =>
    _$IssueCreatedReportImpl(
      personId: json['PersonId'] as int? ?? 0,
      defectId: json['DefectId'] as int? ?? 0,
      departmentId: json['DepartmentId'] as int? ?? 0,
      comment: json['Comment'] as String? ?? '',
      problemMedia: (json['ProblemMedia'] as List<dynamic>?)
              ?.map((e) => ProblemMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$IssueCreatedReportImplToJson(
        _$IssueCreatedReportImpl instance) =>
    <String, dynamic>{
      'PersonId': instance.personId,
      'DefectId': instance.defectId,
      'DepartmentId': instance.departmentId,
      'Comment': instance.comment,
      'ProblemMedia': instance.problemMedia,
    };
