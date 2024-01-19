import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../auth/data/model/user.dart';
import 'audio.dart';
import 'defect.dart';
import 'defect_status.dart';
import 'department_info.dart';
import 'image.dart';

part 'issues.freezed.dart';
part 'issues.g.dart';

@freezed
class IssuesModel extends Equatable with _$IssuesModel {
  const factory IssuesModel(
      {@Default(0) int id,
      @Default(<ImageModel>[]) List<ImageModel> images,
      @Default(<AudioModel>[]) List<AudioModel> audios,
      @Default('') String lastComment,
      @Default('') String comment,
      @Default('') @DateSerializer() String date,
      @Default(true) bool isFromApi,
      @Default(Department()) Department department,
      @Default('') String personName,
      @Default(DefectStatus()) DefectStatus defectStatus}) = _IssuesModel;

  const IssuesModel._();

  factory IssuesModel.fromJson(Map<String, dynamic> json) =>
      _$IssuesModelFromJson(json);

  factory IssuesModel.newIssue(User user) => IssuesModel(
        personName: user.personInfo.fullName(),
        defectStatus: DefectStatus.defaultStatus(),
        date: DateTime.now().toString(),
      );

  factory IssuesModel.filledByDefect(
    Defect defect,
    List<Department> departments,
    List<DefectStatus> defectStatuses,
  ) {
    final images = <ImageModel>[];
    final audios = <AudioModel>[];

    for (final e in defect.hotelDefectMedias) {

      if (e.mediaType.isAudio()) {
        audios.add(AudioModel.fromApi(e.media));
      } else {
        images.add(ImageModel.fromApi(e.media));
      }
    } 
    
    return IssuesModel(
      id: defect.id,
      personName: defect.personName,
      department: Department.matchById(defect.departmentId, departments),
      defectStatus: DefectStatus.matchById(defect.statusId, defectStatuses),
      lastComment: defect.lastComment,
      images: images,
      audios: audios,
      date: defect.createDate.toString(),
      isFromApi: false,
    );
  }

  bool isExistsSomething() =>
      images.isNotEmpty || audios.isNotEmpty || comment.isNotEmpty;

  String dateFormatted(String languageCode) =>
      DateFormat.yMMMEd(languageCode).add_Hm().format(DateTime.parse(date));

  @override
  List<Object?> get props => [images, comment, date, isFromApi, department];
}

class DateSerializer implements JsonConverter<String, dynamic> {
  const DateSerializer();

  @override
  String fromJson(json) => '${DateTime.tryParse(json) ?? DateTime.now()}';

  @override
  toJson(String object) => Never;
}
