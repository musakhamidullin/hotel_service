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
  }) = _Defect;

  factory Defect.fromJson(Map<String, dynamic> json) => _$DefectFromJson(json);
}
