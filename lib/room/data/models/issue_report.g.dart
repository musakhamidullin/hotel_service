// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IssueReportImpl _$$IssueReportImplFromJson(Map<String, dynamic> json) =>
    _$IssueReportImpl(
      personId: json['PersonId'] as int? ?? 0,
      roomId: json['RoomId'] as int? ?? 0,
      problemText: json['ProblemText'] as String? ?? '',
      problemMedia: (json['ProblemMedia'] as List<dynamic>?)
              ?.map((e) => ProblemMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProblemMedia>[],
      departmentId: json['DepartmentId'] as int? ?? 0,
    );

Map<String, dynamic> _$$IssueReportImplToJson(_$IssueReportImpl instance) =>
    <String, dynamic>{
      'PersonId': instance.personId,
      'RoomId': instance.roomId,
      'ProblemText': instance.problemText,
      'ProblemMedia': instance.problemMedia,
      'DepartmentId': instance.departmentId,
    };

_$ProblemMediaImpl _$$ProblemMediaImplFromJson(Map<String, dynamic> json) =>
    _$ProblemMediaImpl(
      mediaBase64: json['MediaBase64'] as String? ?? '',
      mediaType: json['MediaType'] as String? ?? '',
      mediaInBase64: json['MediaInBase64'] as String? ?? '',
    );

Map<String, dynamic> _$$ProblemMediaImplToJson(_$ProblemMediaImpl instance) =>
    <String, dynamic>{
      'MediaBase64': instance.mediaBase64,
      'MediaType': instance.mediaType,
      'MediaInBase64': instance.mediaInBase64,
    };
