part of 'home_cubit.dart';

enum FetchStatus { init, loading, failure, success }

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(FetchStatus.init) FetchStatus fetchStatus,
    @Default(<String,List<Room>>{}) Map<String,List<Room>> rooms,
  }) = _Initial;

  const HomeState._();

  bool loading() => fetchStatus == FetchStatus.loading;
  bool success() => fetchStatus == FetchStatus.success;
  bool failure() => fetchStatus == FetchStatus.failure;
}
