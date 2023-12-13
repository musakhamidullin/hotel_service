import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:path/path.dart';

import '../../cubit/room_cubit.dart';
import 'issues.dart';

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

  factory IssueReport.filledByIssueState(
          RoomState roomState, IssuesState issue) =>
      IssueReport(
          personId: roomState.user.personInfo.id,
          problemMedia: issue.images.map((e) {
            return ProblemMedia.fromFile(e);
          }).toList(),
          problemText: issue.comment,
          roomId: roomState.room.roomId);
}

@freezed
class ProblemMedia with _$ProblemMedia {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory ProblemMedia({
    @Default('') String mediaBase64,
    @Default('') String mediaType,
    @Default('') String mediaInBase64,
  }) = _ProblemMedia;

  factory ProblemMedia.fromFile(String path) => ProblemMedia(
      mediaType: extension(path),
      mediaInBase64: base64Encode(File(path).readAsBytesSync()),
      mediaBase64: base64Encode(File(path).readAsBytesSync()));

  factory ProblemMedia.fromJson(Map<String, dynamic> json) =>
      _$ProblemMediaFromJson(json);
}
