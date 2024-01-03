part of 'my_schedule_cubit.dart';

enum FetchStatus { init, loading, failure, success, paging }

@freezed
class MyScheduleState with _$MyScheduleState {
  const factory MyScheduleState({
    @Default(FetchStatus.init) FetchStatus fetchStatus,
    @Default(<TimeRegion>[]) List<TimeRegion> schedule,
  }) = _Initial;

  const MyScheduleState._();

  bool loading() => fetchStatus == FetchStatus.loading;

  bool success() => fetchStatus == FetchStatus.success;

  bool failure() => fetchStatus == FetchStatus.failure;
}
