import '../../../../app/dio_client.dart';
import '../models/schedule_info.dart';

class MyScheduleRep {
  Future<ScheduleInfo> fetchMySchedule({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int ownerId,
  }) async {
    final result = await DioClient().post<Map<String, dynamic>>(
        path:
            'HouseKeeping/GetWorkBreaksByPersonId?ticketPersonId=$ownerId&dateStart=${dateStart.toIso8601String()}&DateFinish=${dateEnd.toIso8601String()}');

    return ScheduleInfo.fromJson(result.data);
  }
}
