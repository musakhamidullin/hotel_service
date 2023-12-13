import 'package:freezed_annotation/freezed_annotation.dart';

import 'defect.dart';
import 'department_info.dart';

part 'issues.freezed.dart';
part 'issues.g.dart';

@freezed
class IssuesState with _$IssuesState {
  const factory IssuesState(
      {@Default(0) int index,
      @Default(<String>[]) List<String> images,
      @Default('') String comment,
      @Default('') @DateSerializer() String date,
      @Default(true) isMutable,
      @Default(Department()) Department department}) = _IssuesState;

  factory IssuesState.fromJson(Map<String, dynamic> json) =>
      _$IssuesStateFromJson(json);

  factory IssuesState.newIssue(int i) => IssuesState(
        index: i,
        date: DateTime.now().toString(),
      );

  factory IssuesState.filledByDefect(Defect defect, int i) => IssuesState(
      index: i,
      comment: defect.text,
      images: defect.hotelDefectMedias.map((e) => e.mediaInBase64).toList(),
      date: defect.createDate.toString(),
      isMutable: false);
}

class DateSerializer implements JsonConverter<String, dynamic> {
  const DateSerializer();

  @override
  String fromJson(json) => '${DateTime.tryParse(json) ?? DateTime.now()}';

  @override
  toJson(String object) => Never;
}
