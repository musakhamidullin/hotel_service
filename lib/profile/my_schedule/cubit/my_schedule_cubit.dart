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
        date: DateTime.now(),
        ownerId: user.personInfo.ownerId,
      );

      final schedule = <TimeRegion>[];

      for (final e in result) {
        schedule.addAll([
          TimeRegion(
            startTime: e.startDay,
            endTime: e.endDay,
          ),
          TimeRegion(
            startTime: e.startBreak,
            endTime: e.endBreak,
            text: 'обед',
          ),
        ]);
      }

      emit(state.copyWith(
        fetchStatus: FetchStatus.success,
        schedule: schedule,
      ));
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }
}
