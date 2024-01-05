import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../cubit/room_cubit.dart';
import 'issue_report.dart';
import 'issues.dart';

part 'issue_created_report.freezed.dart';
part 'issue_created_report.g.dart';

@freezed
class IssueCreatedReport with _$IssueCreatedReport {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory IssueCreatedReport({
    @Default(0) int personId,
    @Default(0) int defectId,
    @Default('') String comment,
    @Default([]) List<ProblemMedia> problemMedia,
  }) = _IssueCreatedReport;

  factory IssueCreatedReport.fromJson(Map<String, dynamic> json) =>
      _$IssueCreatedReportFromJson(json);

  static IssueCreatedReport fill(RoomState roomState, IssuesModel issue) {
    final images = issue.images.map((e) {
      final bytes = const Base64Decoder().convert(e);
      return ProblemMedia.fromFile(e, _getExtension(bytes));
    }).toList();

    //харкод типа аудио записи
    final audio = issue.audios
        .map((e) => ProblemMedia.fromFile(e, MediaType.m4a))
        .toList();
    return IssueCreatedReport(
        comment: issue.comment,
        personId: roomState.user.personInfo.id,
        problemMedia: [...images, ...audio],
        defectId: issue.id);
  }

  static MediaType _getExtension(Uint8List data) {
    if (data[0] == 0xff && data[1] == 0xd8) {
      return MediaType.jpg;
    } else if (data[0] == 0x89 &&
        data[1] == 0x50 &&
        data[2] == 0x4e &&
        data[3] == 0x47) {
      return MediaType.png;
    } else if (data[0] == 0x47 && data[1] == 0x49 && data[2] == 0x46) {
      return MediaType.gif;
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
          return MediaType.mp3;
        }
        offset += frameSize + 10;
      }
    }
    return throw Exception('none format');
  }
}
