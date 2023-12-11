import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'issue_report.freezed.dart';
part 'issue_report.g.dart';

IssueReport issueReportFromJson(String str) =>
    IssueReport.fromJson(json.decode(str));

String issueReportToJson(IssueReport data) => json.encode(data.toJson());

@freezed
class IssueReport with _$IssueReport {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory IssueReport({
    @Default(0) int personId,
    @Default(0) int roomId,
    @Default('') String problemText,
    @Default(<ProblemMedia>[]) List<ProblemMedia> problemMedia,
  }) = _IssueReport;

  factory IssueReport.fromJson(Map<String, dynamic> json) =>
      _$IssueReportFromJson(json);
}

@freezed
class ProblemMedia with _$ProblemMedia {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory ProblemMedia({
    @Default('') String mediaBase64,
    @Default('') String mediaType,
  }) = _ProblemMedia;

  factory ProblemMedia.fromJson(Map<String, dynamic> json) =>
      _$ProblemMediaFromJson(json);
}
