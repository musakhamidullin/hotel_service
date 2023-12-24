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
    @Default(0) int departmentId,
  }) = _IssueReport;

  factory IssueReport.fromJson(Map<String, dynamic> json) =>
      _$IssueReportFromJson(json);

  static IssueReport fill(RoomState roomState, IssuesModel issue) {
    final images = issue.images.map((e) {
      final bytes = const Base64Decoder().convert(e);
      return ProblemMedia.fromFile(e, _getExtension(bytes));
    }).toList();
    return IssueReport(
          departmentId: issue.department.id,
          personId: roomState.user.personInfo.id,
          problemMedia: [...images],
          problemText: issue.comment,
          roomId: roomState.room.roomId);
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

enum MediaType {
  jpg,
  png,
  gif,
  mp3,
  m4a,
  unknown;

  bool isPic() => this == MediaType.jpg || this == MediaType.png;
  bool isAudio() => this == MediaType.mp3 || this == MediaType.m4a;
}

class MediaTypeConverter implements JsonConverter<MediaType, String> {
  const MediaTypeConverter();

  @override
  MediaType fromJson(String value) {
    try {
      return MediaType.values.byName(value);
    } catch (_) {
      return MediaType.unknown;
    }
  }

  @override
  String toJson(MediaType value) => '.${value.name}';
}

@freezed
class ProblemMedia with _$ProblemMedia {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory ProblemMedia({
    @Default('') String mediaBase64,
    @Default(MediaType.jpg) @MediaTypeConverter() MediaType mediaType,
    @JsonSerializable(includeIfNull: false) @Default('') String mediaInBase64,
  }) = _ProblemMedia;

  factory ProblemMedia.fromFile(String bytes, MediaType extension) =>
      ProblemMedia(mediaType: extension, mediaInBase64: '', mediaBase64: bytes);

  factory ProblemMedia.fromJson(Map<String, dynamic> json) =>
      _$ProblemMediaFromJson(json);
}
