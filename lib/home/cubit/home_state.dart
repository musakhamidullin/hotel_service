part of 'home_cubit.dart';

enum FetchStatus { init, loading, failure, success, searching, paging }

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(FetchStatus.init) FetchStatus fetchStatus,
    @Default(<int, List<Room>>{}) Map<int, List<Room>> rooms,
    @Default('') String query,
    FilterValue? filterValue,
  }) = _Initial;

  const HomeState._();

  bool loading() => fetchStatus == FetchStatus.loading;

  bool success() => fetchStatus == FetchStatus.success;

  bool failure() => fetchStatus == FetchStatus.failure;

  bool searching() => fetchStatus == FetchStatus.searching;

  bool paging() => fetchStatus == FetchStatus.paging;

  bool nothingFound() =>
      success() && rooms.isEmpty && (query.isNotEmpty || filterValue != null);
}
