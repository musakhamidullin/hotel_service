import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'defect.dart';
import 'department_info.dart';

part 'issues.freezed.dart';

part 'issues.g.dart';

@freezed
class IssuesState extends Equatable with _$IssuesState {
  const factory IssuesState({
    @Default(<String>[]) List<String> images,
    @Default('') String comment,
    @Default('') @DateSerializer() String date,
    @Default(true) isMutable,
    @Default(Department()) Department department,
  }) = _IssuesState;

  const IssuesState._();

  factory IssuesState.fromJson(Map<String, dynamic> json) =>
      _$IssuesStateFromJson(json);

  factory IssuesState.newIssue() => IssuesState(
        date: DateTime.now().toString(),
      );

  factory IssuesState.filledByDefect(Defect defect) => IssuesState(
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
