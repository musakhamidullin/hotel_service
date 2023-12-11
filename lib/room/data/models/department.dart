import 'package:freezed_annotation/freezed_annotation.dart';

part 'department.freezed.dart';
part 'department.g.dart';

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
