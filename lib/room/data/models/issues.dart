import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'defect.dart';
import 'department_info.dart';

part 'issues.freezed.dart';

part 'issues.g.dart';

@freezed
class IssuesModel with _$IssuesModel {
  const factory IssuesModel({
    @Default(<String>[]) List<String> images,
    @Default('') String comment,
    @Default('') @DateSerializer() String date,
    @Default(true) isMutable,
    @Default(Department()) Department department,
  }) = _IssuesModel;

  const IssuesModel._();

  factory IssuesModel.fromJson(Map<String, dynamic> json) =>
      _$IssuesModelFromJson(json);

  factory IssuesModel.newIssue() => IssuesModel(
        date: DateTime.now().toString(),
      );

  factory IssuesModel.filledByDefect(Defect defect) => IssuesModel(
        comment: defect.text,
        images: defect.hotelDefectMedias.map((e) => e.mediaInBase64).toList(),
        date: defect.createDate.toString(),
        isMutable: false,
      );

  @override
  List<Object?> get props => [images, comment, date, isMutable, department];
}

class DateSerializer implements JsonConverter<String, dynamic> {
  const DateSerializer();

  @override
  String fromJson(json) => '${DateTime.tryParse(json) ?? DateTime.now()}';

  @override
  toJson(String object) => Never;
}
