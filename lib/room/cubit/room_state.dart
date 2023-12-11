part of 'room_cubit.dart';

enum FetchStatus { init, loading, success, failure }

@freezed
class RoomState with _$RoomState {
  const factory RoomState({
    @Default(FetchStatus.init) FetchStatus fetchStatus,
    @Default(Room()) Room room,
    @Default(<(int, List<XFile>, String, DateTime, bool isMutable)>[])
    List<(int, List<XFile>, String, DateTime, bool isMutable)> issues,
    @Default(<Department>[]) List<Department> departments,
    @Default(0) int ownerId,
  }) = _RoomState;

  const RoomState._();

  bool loading() => fetchStatus == FetchStatus.loading;

  bool success() => fetchStatus == FetchStatus.success;

  bool failure() => fetchStatus == FetchStatus.failure;
}
