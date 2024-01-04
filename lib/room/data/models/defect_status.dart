// To parse this JSON data, do
//
//     final defectStatusInfo = defectStatusInfoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'defect_status.freezed.dart';
part 'defect_status.g.dart';

@freezed
class DefectStatusInfo with _$DefectStatusInfo {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory DefectStatusInfo({
    @Default(<DefectStatus>[]) List<DefectStatus> data,
  }) = _DefectStatusInfo;

  factory DefectStatusInfo.fromJson(Map<String, dynamic> json) =>
      _$DefectStatusInfoFromJson(json);
}

@freezed
class DefectStatus with _$DefectStatus {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory DefectStatus({
    @Default(0) int id,
    @Default('') String name,
  }) = _DefectStatus;

  factory DefectStatus.fromJson(Map<String, dynamic> json) =>
      _$DefectStatusFromJson(json);
}
