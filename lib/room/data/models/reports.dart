import 'package:freezed_annotation/freezed_annotation.dart';

import 'issue_report.dart';

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
}
