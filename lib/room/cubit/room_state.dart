part of 'room_cubit.dart';

enum FetchStatus { init, loading, refreshing, success, failure }

enum DefectStatus { created, done, assigned }

@freezed
class RoomState with _$RoomState {
  const factory RoomState({
    @Default(FetchStatus.init) FetchStatus fetchStatus,
    @Default(Room()) Room room,
    //todo int перевести в enum
    @Default(<int, List<IssuesModel>>{}) Map<int, List<IssuesModel>> issues,
    @Default(<Department>[]) List<Department> departments,
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
