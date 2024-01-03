import '../models/schedule_value.dart';

class MyScheduleRep {
  Future<List<ScheduleValue>> fetchMySchedule({
    required DateTime date,
    required int ownerId,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return [
      ScheduleValue(
        startDay: DateTime(2024, 1, 3, 8),
        endDay: DateTime(2024, 1, 3, 20),
        startBreak: DateTime(2024, 1, 3, 12),
        endBreak: DateTime(2024, 1, 3, 13),
      ),
      ScheduleValue(
        startDay: DateTime(2024, 1, 4, 8),
        endDay: DateTime(2024, 1, 4, 20),
        startBreak: DateTime(2024, 1, 4, 12),
        endBreak: DateTime(2024, 1, 4, 13),
      ),
      ScheduleValue(
        startDay: DateTime(2024, 1, 5, 8),
        endDay: DateTime(2024, 1, 5, 20),
        startBreak: DateTime(2024, 1, 5, 12),
        endBreak: DateTime(2024, 1, 5, 13),
      ),
    ];
  }
}
