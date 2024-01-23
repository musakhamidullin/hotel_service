part of 'comments_cubit.dart';

enum FetchStatus { init, loading, refreshing, success, failure, paging, none }

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState({
    @Default(FetchStatus.init) FetchStatus fetchStatus,
    @Default(<MessageValue>[]) List<MessageValue> messages,
    @Default(ReportCleaningProblemUpdate())
    ReportCleaningProblemUpdate reportCleaningProblemUpdate,
  }) = _CommentsState;

  const CommentsState._();

  bool loading() => fetchStatus == FetchStatus.loading;

  bool success() => fetchStatus == FetchStatus.success;

  bool failure() => fetchStatus == FetchStatus.failure;

  bool paging() => fetchStatus == FetchStatus.paging;
}
