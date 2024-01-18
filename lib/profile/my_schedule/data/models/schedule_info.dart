import 'package:freezed_annotation/freezed_annotation.dart';

import 'interval_value.dart';

part 'schedule_info.g.dart';

part 'schedule_info.freezed.dart';

@freezed
class ScheduleInfo with _$ScheduleInfo {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory ScheduleInfo({
    List<IntervalValue>? breaks,
    List<IntervalValue>? workIntervals,
    List<DateTime>? freeDays,
  }) = _ScheduleInfo;

  factory ScheduleInfo.fromJson(Map<String, dynamic> json) =>
      _$ScheduleInfoFromJson(json);
}
