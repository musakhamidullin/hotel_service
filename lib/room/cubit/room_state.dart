part of 'room_cubit.dart';

enum FetchStatus { init, loading, success, failure }

@freezed
class RoomState with _$RoomState {
  const factory RoomState({
    @Default(FetchStatus.init) FetchStatus fetchStatus,
    @Default(Room()) Room room,
    @Default({}) Map<int, List<IssuesModel>> issues,
    @Default(<Department>[]) List<Department> departments,
    @Default(User(userId: '', personInfo: Person(id: 0))) User user,
    @Default(0) int tabIndex,
  }) = _RoomState;

  const RoomState._();

  bool loading() => fetchStatus == FetchStatus.loading;

  bool success() => fetchStatus == FetchStatus.success;

  bool failure() => fetchStatus == FetchStatus.failure;
}
