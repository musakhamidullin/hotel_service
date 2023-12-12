import 'package:freezed_annotation/freezed_annotation.dart';

import 'issues.dart';

part 'defect.freezed.dart';
part 'defect.g.dart';

@freezed
class Defect with _$Defect {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory Defect({
    required int id,
    required String text,
    required DateTime createDate,
    // required List<dynamic> hotelDefectMedias,
  }) = _Defect;

  factory Defect.fromJson(Map<String, dynamic> json) => _$DefectFromJson(json);
}
