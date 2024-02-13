import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mime/mime.dart';

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
    final images = issue.images
        .mapWhere(
            (e) => !e.isFromApi, (e) => ProblemMedia.fromFilePath(e.image))
        .toList();

    //харкод типа аудио записи
    final audio = issue.audios
        .mapWhere(
            (e) => !e.isFromApi, (e) => ProblemMedia.fromFilePath(e.audio))
        .toList();
    return ReportCleaningProblemUpdate(
      comment: issue.comment,
      problemMedia: [...images, ...audio],
    );
  }

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
