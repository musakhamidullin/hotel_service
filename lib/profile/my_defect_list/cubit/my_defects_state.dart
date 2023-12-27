part of 'my_defects_cubit.dart';

enum FetchStatus { init, loading, failure, success, paging }

@freezed
class MyDefectsState with _$MyDefectsState {
  const factory MyDefectsState({
    @Default(FetchStatus.init) FetchStatus fetchStatus,
  }) = _Initial;

  const MyDefectsState._();

  bool loading() => fetchStatus == FetchStatus.loading;

  bool success() => fetchStatus == FetchStatus.success;

  bool failure() => fetchStatus == FetchStatus.failure;

  bool paging() => fetchStatus == FetchStatus.paging;
}
