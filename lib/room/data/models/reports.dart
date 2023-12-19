import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../cubit/room_cubit.dart';
import 'issue_report.dart';
import 'issues.dart';

part 'reports.freezed.dart';
part 'reports.g.dart';

@freezed
class Reports with _$Reports {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory Reports({
    @Default(0) int personId,
    @Default(0) int roomId,
    @Default([]) List<ProblemList> problemList,
  }) = _Reports;

  factory Reports.fromJson(Map<String, dynamic> json) =>
      _$ReportsFromJson(json);

  // factory Reports.fill(RoomState roomState, List<ProblemList> problemList) =>
  //     Reports(
  //         roomId: roomState.room.roomId,
  //         personId: roomState.user.personInfo.id,
  //         problemList: problemList);
}

@freezed
class ProblemList with _$ProblemList {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory ProblemList({
    @Default('') String problemText,
    @Default(0) int departmentId,
    @Default([]) List<ProblemMedia> problemMedia,
  }) = _ProblemList;

  factory ProblemList.fromJson(Map<String, dynamic> json) =>
      _$ProblemListFromJson(json);

  // factory ProblemList.fill(IssuesState state) => ProblemList(
  //     departmentId: state.department.id,
  //     problemMedia: state.images.map((e) {
  //       final bytes = const Base64Decoder().convert(e);
  //       return ProblemMedia.fromFile(e, _getExtension(bytes));
  //     }).toList(),
  //     problemText: state.comment);

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
