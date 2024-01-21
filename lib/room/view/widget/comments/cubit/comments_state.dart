part of 'comments_cubit.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState({
    @Default(<MessageValue>[]) List<MessageValue> messages,
  }) = _Initial;
}
