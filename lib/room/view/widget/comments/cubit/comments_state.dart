part of 'comments_cubit.dart';

enum FetchStatus { init, loading, refreshing, success, failure, paging, messaging, none }

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState({
    @Default(FetchStatus.init) FetchStatus fetchStatus,
    @Default(<MessageValue>[]) List<MessageValue> messages,
  }) = _CommentsState;

  const CommentsState._();

  bool loading() => fetchStatus == FetchStatus.loading;

  bool success() => fetchStatus == FetchStatus.success;

  bool failure() => fetchStatus == FetchStatus.failure;

  bool paging() => fetchStatus == FetchStatus.paging;
}
