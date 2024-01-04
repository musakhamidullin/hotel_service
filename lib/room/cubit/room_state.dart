part of 'room_cubit.dart';

enum FetchStatus { init, loading, refreshing, success, failure }

enum DefectStatuses {
  none,
  created,
  assigned,
  done;

  static DefectStatuses matchById(int id) => switch (id) {
        1 => DefectStatuses.created,
        2 => DefectStatuses.assigned,
        3 => DefectStatuses.done,
        int() => DefectStatuses.none
      };

  static Color matchByStatus(DefectStatuses status) => switch (status) {
        DefectStatuses.none => Colors.grey.withOpacity(0.5),
        DefectStatuses.created => Colors.yellow.withOpacity(0.5),
        DefectStatuses.assigned => Colors.orange.withOpacity(0.5),
        DefectStatuses.done => Colors.green.withOpacity(0.5),
      };
}

@freezed
class RoomState with _$RoomState {
  const factory RoomState({
    @Default(FetchStatus.init) FetchStatus fetchStatus,
    @Default(Room()) Room room,
    //todo int перевести в enum
    @Default(<int, List<IssuesModel>>{}) Map<int, List<IssuesModel>> issues,
    @Default(<Department>[]) List<Department> departments,
    @Default(<DefectStatus>[]) List<DefectStatus> defectStatus,
    @Default(
      User(
        userId: '',
        personInfo: Person(id: 0, ownerId: 0),
      ),
    )
    User user,
    @Default(0) int tabIndex,
  }) = _RoomState;

  const RoomState._();

  bool loading() => fetchStatus == FetchStatus.loading;

  bool refreshing() => fetchStatus == FetchStatus.refreshing;

  bool success() => fetchStatus == FetchStatus.success;

  bool failure() => fetchStatus == FetchStatus.failure;
}
