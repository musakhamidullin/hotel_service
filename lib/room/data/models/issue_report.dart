import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mime/mime.dart';
import 'dart:convert';

import '../../cubit/room_cubit.dart';
import 'issues.dart';

part 'issue_report.freezed.dart';

part 'issue_report.g.dart';

extension MapWhere<T> on Iterable<T> {
  Iterable<R> mapWhere<R>(bool Function(T) filter, R Function(T) transform) {
    return where(filter).map(transform);
  }
}

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
    final images = issue.images.mapWhere((e) => !e.isFromApi, (e) {
      return ProblemMedia.fromFilePath(e.image);
    }).toList();

    //харкод типа аудио записи
    final audio = issue.audios
        .mapWhere(
            (e) => !e.isFromApi, (e) => ProblemMedia.fromAudioBytes(e.audio))
        .toList();
    return IssueReport(
      departmentId: issue.department.id,
      personId: roomState.user.personInfo.id,
      problemMedia: [...images, ...audio],
      problemText: issue.comment,
      roomId: roomState.room.roomId,
    );
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

  static _getFileExtension(String url) {
    List<String> parts = url.split("/");
    String fileName = parts.last;
    List<String> fileNameParts = fileName.split(".");
    String fileExtension = fileNameParts.last;
    return fileExtension;
  }

  static MediaType getMediaType(String url) {
    final data = _getFileExtension(url);

    for (final e in MediaType.values) {
      if (data.contains(e.name)) {
        return e;
      }
    }

    return MediaType.unknown;
  }
}

class MediaTypeConverter implements JsonConverter<MediaType, String> {
  const MediaTypeConverter();

  @override
  MediaType fromJson(String value) => MediaType.getMediaType(value);

  @override
  String toJson(MediaType value) => '.${value.name}';
}

@freezed
class ProblemMedia with _$ProblemMedia {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory ProblemMedia({
    @Default('') String mediaBase64,
    @Default(MediaType.unknown) @MediaTypeConverter() MediaType mediaType,
    @JsonSerializable(includeIfNull: false) @Default('') String media,
  }) = _ProblemMedia;

  const ProblemMedia._();

  factory ProblemMedia.fromFilePath(
    String filePath,
  ) =>
      ProblemMedia(
        mediaType: _getExtensionFromFilePath(filePath),
        media: '',
        mediaBase64: _getBase64String(filePath),
      );

  factory ProblemMedia.fromAudioBytes(
    String bytes,
  ) =>
      ProblemMedia(
        mediaType: MediaType.m4a,
        media: '',
        mediaBase64: bytes,
      );

  factory ProblemMedia.fromJson(Map<String, dynamic> json) =>
      _$ProblemMediaFromJson(json);

  static MediaType _getExtensionFromFilePath(String filePath) {
    final type = extensionFromMime(lookupMimeType(filePath) ?? '');
    return switch (type) {
      'gif' => MediaType.gif,
      'mp3' => MediaType.mp3,
      'm4a' => MediaType.m4a,
      'png' => MediaType.png,
      'jpg' => MediaType.jpg,
      'jpeg' || 'jpe' => MediaType.jpg,
      String() => throw Exception('NONE FORMAT'),
    };
  }

  static String _getBase64String(String filePath) =>
      const Base64Encoder().convert(File(filePath).readAsBytesSync());
}
