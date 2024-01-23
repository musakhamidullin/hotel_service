import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/message_value.dart';
import '../data/models/paged_messages.dart';
import '../data/models/report_update.dart';
import '../repositories/comment_repo.dart';

part 'comments_state.dart';
part 'comments_cubit.freezed.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(CommentRepo commentRepo,
      ReportCleaningProblemUpdate reportCleaningProblemUpdate)
      : _commentRepo = commentRepo,
        super(CommentsState(
            reportCleaningProblemUpdate: reportCleaningProblemUpdate,
            pagedMessages: PagedMessages.getDefectId(
                reportCleaningProblemUpdate.defectId)));

  final CommentRepo _commentRepo;

  Future<void> fetchMessages() async {
    if (isClosed) return;

    try {
      emit(state.copyWith(fetchStatus: FetchMessageStatus.loading));

      final result = await _commentRepo.fetchComments(state.pagedMessages);

      emit(state.copyWith(fetchStatus: FetchMessageStatus.success));
    } catch (_) {}
  }

  Future<void> updatePagedMessage(PagedMessages pagedMessages) async {
    if (isClosed) return;

    emit(state.copyWith(pagedMessages: pagedMessages));
  }

  Future<void> updateReportCleaningProblemUpdate(
      ReportCleaningProblemUpdate reportCleaningProblemUpdate) async {
    if (isClosed) return;

    emit(state.copyWith(
        reportCleaningProblemUpdate: reportCleaningProblemUpdate));
  }

  Future<void> sendMessage(MessageValue value) async {
    if (isClosed) return;

    try {
      emit(state.copyWith(fetchStatus: FetchMessageStatus.loading));

      final result =
          _commentRepo.sendComment(state.reportCleaningProblemUpdate);

      emit(state.copyWith(
          messages: [...state.messages, value],
          fetchStatus: FetchMessageStatus.success));
    } catch (_) {}
  }
}
