import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'department_info.freezed.dart';
part 'department_info.g.dart';

DepartmentInfo departmentInfoFromJson(String str) =>
    DepartmentInfo.fromJson(json.decode(str));

String departmentInfoToJson(DepartmentInfo data) => json.encode(data.toJson());

@freezed
class DepartmentInfo with _$DepartmentInfo {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory DepartmentInfo({
    @Default(<Department>[]) List<Department> data,
  }) = _DepartmentInfo;

  factory DepartmentInfo.fromJson(Map<String, dynamic> json) =>
      _$DepartmentInfoFromJson(json);
}


@freezed
class Department with _$Department {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory Department({
    @Default(0) int id,
    @Default('') String fullName,
    @Default('') String shortName,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}
