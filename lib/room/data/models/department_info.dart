import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'department.dart';

part 'department_info.freezed.dart';
part 'department_info.g.dart';

DepartmentInfo departmentInfoFromJson(String str) =>
    DepartmentInfo.fromJson(json.decode(str));

String departmentInfoToJson(DepartmentInfo data) => json.encode(data.toJson());

@freezed
class DepartmentInfo with _$DepartmentInfo {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory DepartmentInfo({
    // required dynamic errorCode,
    @Default(<Department>[]) List<Department> data,
    // required dynamic user,
  }) = _DepartmentInfo;

  factory DepartmentInfo.fromJson(Map<String, dynamic> json) =>
      _$DepartmentInfoFromJson(json);
}
