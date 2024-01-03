import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_value.g.dart';

part 'schedule_value.freezed.dart';

@freezed
class ScheduleValue with _$ScheduleValue {
  const factory ScheduleValue({
    required DateTime startDay,
    required DateTime endDay,
    required DateTime startBreak,
    required DateTime endBreak,
}) = _ScheduleValue;

  factory ScheduleValue.fromJson(Map<String, dynamic> json) =>
      _$ScheduleValueFromJson(json);
}
