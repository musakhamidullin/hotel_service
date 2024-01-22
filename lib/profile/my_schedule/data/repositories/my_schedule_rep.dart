import '../models/schedule_value.dart';

class MyScheduleRep {
  Future<List<ScheduleValue>> fetchMySchedule({
    required DateTime date,
    required int ownerId,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return [
      ScheduleValue(
        startDay: DateTime(2024, DateTime.now().month, DateTime.now().day, 8),
        endDay: DateTime(2024, DateTime.now().month, DateTime.now().day, 20),
        startBreak: DateTime(2024, DateTime.now().month, DateTime.now().day, 12),
        endBreak: DateTime(2024, DateTime.now().month, DateTime.now().day, 13),
      ),
      ScheduleValue(
        startDay: DateTime(2024, DateTime.now().month, DateTime.now().day + 1, 8),
        endDay: DateTime(2024, DateTime.now().month, DateTime.now().day + 1, 20),
        startBreak: DateTime(2024, DateTime.now().month, DateTime.now().day + 1, 12),
        endBreak: DateTime(2024, DateTime.now().month, DateTime.now().day + 1, 13),
      ),
    ];
  }
}
