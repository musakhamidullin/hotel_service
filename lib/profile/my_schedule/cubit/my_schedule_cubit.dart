import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../auth/data/model/user.dart';
import '../data/repositories/my_schedule_rep.dart';

part 'my_schedule_state.dart';

part 'my_schedule_cubit.freezed.dart';

class MyScheduleCubit extends Cubit<MyScheduleState> {
  MyScheduleCubit({
    required this.myScheduleRep,
    required this.user,
  }) : super(const MyScheduleState());

  final MyScheduleRep myScheduleRep;
  final User user;

  Future<void> fetchMySchedule() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      final result = await myScheduleRep.fetchMySchedule(
        dateStart: DateTime.now(),
        dateEnd: DateTime.now().add(const Duration(days: 7)),
        ownerId: user.personInfo.ownerId,
      );

      final schedule = [
        ...?result.breaks?.map((e) {
          if (e.timeStart == null || e.timeEnd == null) return null;
          return TimeRegion(
            startTime: e.timeStart!,
            endTime: e.timeEnd!,
            text: 'обед',
          );
        }).whereType<TimeRegion>(),
        ...?result.workIntervals?.map((e) {
          if (e.timeStart == null || e.timeEnd == null) return null;
          return TimeRegion(
            startTime: e.timeStart!,
            endTime: e.timeEnd!,
          );
        }).whereType<TimeRegion>()
      ];

      emit(state.copyWith(
        fetchStatus: FetchStatus.success,
        schedule: schedule,
      ));
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }
}
