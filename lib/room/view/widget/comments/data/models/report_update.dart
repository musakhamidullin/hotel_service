import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../cubit/room_cubit.dart';
import '../../../../../data/models/issue_report.dart';
import '../../../../../data/models/issues.dart';

part 'report_update.freezed.dart';

part 'report_update.g.dart';

@freezed
class ReportCleaningProblemUpdate with _$ReportCleaningProblemUpdate {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory ReportCleaningProblemUpdate({
    @Default(0) int personId,
    @Default(0) int defectId,
    @Default(0) int departmentId,
    @Default('') String comment,
    @Default([]) List<ProblemMedia> problemMedia,
  }) = _ReportCleaningProblemUpdate;

  factory ReportCleaningProblemUpdate.fromJson(Map<String, dynamic> json) =>
      _$ReportCleaningProblemUpdateFromJson(json);

  factory ReportCleaningProblemUpdate.modelForComments(
          RoomState roomState, IssuesModel issue) =>
      ReportCleaningProblemUpdate(
        personId: roomState.user.personInfo.id,
        departmentId: issue.department.id,
        defectId: issue.id,
      );

  static ReportCleaningProblemUpdate fill(IssuesModel issue) {
    final images = issue.images.mapWhere((e) => !e.isFromApi, (e) {
      final bytesFromFile = base64Encode(File(e.image).readAsBytesSync());
      final bytes = const Base64Decoder().convert(bytesFromFile);
      return ProblemMedia.fromFile(bytesFromFile, _getExtension(bytes));
    }).toList();

    //харкод типа аудио записи
    final audio = issue.audios
        .mapWhere((e) => !e.isFromApi,
            (e) => ProblemMedia.fromFile(e.audio, MediaType.m4a))
        .toList();
    return ReportCleaningProblemUpdate(
      comment: issue.comment,
      problemMedia: [...images, ...audio],
    );
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
