part of 'room_cubit.dart';

enum FetchStatus { init, loading, success, failure }

@freezed
class RoomState with _$RoomState {
  const factory RoomState({
    @Default(FetchStatus.init) FetchStatus fetchStatus,
  }) = _Initial;

  const RoomState._();

  bool loading() => fetchStatus == FetchStatus.loading;

  bool success() => fetchStatus == FetchStatus.success;

  bool failure() => fetchStatus == FetchStatus.failure;
}
