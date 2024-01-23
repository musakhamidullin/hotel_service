part of 'comments_cubit.dart';

enum FetchMessageStatus { init, loading, refreshing, success, failure, none }

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState(
          {@Default(FetchMessageStatus.init) FetchMessageStatus fetchStatus,
          @Default(<MessageValue>[]) List<MessageValue> messages,
          @Default(ReportCleaningProblemUpdate())
          ReportCleaningProblemUpdate reportCleaningProblemUpdate}) =
      _CommentsState;
}
