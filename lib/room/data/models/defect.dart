import 'package:freezed_annotation/freezed_annotation.dart';

import 'issue_report.dart';

part 'defect.freezed.dart';
part 'defect.g.dart';

@freezed
class Defect with _$Defect {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory Defect({
    @Default(0) int id,
    @Default('') String text,
    @Default('') String createDate,
    @Default([])
    @JsonKey(name: 'hotelDefectMedias')
    List<ProblemMedia> hotelDefectMedias,
    @Default('') String lastComment,
    @Default(0) int commentsCount,
    @Default(0) int personId,
    @Default('') String personName,
    @Default(0) int statusId,
    @Default(0) int departmentId,
  }) = _Defect;

  factory Defect.fromJson(Map<String, dynamic> json) => _$DefectFromJson(json);
}
