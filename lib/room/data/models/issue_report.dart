import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

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

  static IssueReport filledByIssueState(
          RoomState roomState, IssuesState issue) =>
      IssueReport(
          personId: roomState.user.personInfo.id,
          problemMedia: issue.images.map((e) {
            final bytes = const Base64Decoder().convert(e);
            return ProblemMedia.fromFile(e, _getExtension(bytes));
          }).toList(),
          problemText: issue.comment,
          roomId: roomState.room.roomId);

  static String _getExtension(Uint8List data) {
    if (data[0] == 0xff && data[1] == 0xd8) {
      return 'jpg';
    } else if (data[0] == 0x89 &&
        data[1] == 0x50 &&
        data[2] == 0x4e &&
        data[3] == 0x47) {
      return 'png';
    } else if (data[0] == 0x47 && data[1] == 0x49 && data[2] == 0x46) {
      return 'gif';
    } else if (data[0] == 0x49 && data[1] == 0x44 && data[2] == 0x33) {
      int offset = 10;
      while (offset + 10 < data.length) {
        int frameSize = ((data[offset + 4] << 24) |
            (data[offset + 5] << 16) |
            (data[offset + 6] << 8) |
            data[offset + 7]);
        if (frameSize + offset > data.length) {
          break;
        }
        if (data[offset] == 0x54 &&
            data[offset + 1] == 0x50 &&
            data[offset + 2] == 0x45 &&
            data[offset + 3] == 0x31) {
          return 'mp3';
        }
        offset += frameSize + 10;
      }
    }
    return throw Exception('none format');
  }
}

@freezed
class ProblemMedia with _$ProblemMedia {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory ProblemMedia({
    @Default('') String mediaBase64,
    @Default('') String mediaType,
    @Default('') String mediaInBase64,
  }) = _ProblemMedia;

  factory ProblemMedia.fromFile(String bytes, String extension) => ProblemMedia(
      mediaType: extension, mediaInBase64: bytes, mediaBase64: bytes);

  factory ProblemMedia.fromJson(Map<String, dynamic> json) =>
      _$ProblemMediaFromJson(json);
}
