import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/message_value.dart';
import '../data/models/report_update.dart';
import '../repositories/comment_repo.dart';

part 'comments_state.dart';
part 'comments_cubit.freezed.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(CommentRepo commentRepo,
      ReportCleaningProblemUpdate reportCleaningProblemUpdate)
      : _commentRepo = commentRepo,
        super(CommentsState(
            reportCleaningProblemUpdate: reportCleaningProblemUpdate));

  final CommentRepo _commentRepo;

  Future<void> sendMessage(MessageValue value) async {
    if (isClosed) return;

    try {
      emit(state.copyWith(fetchStatus: FetchMessageStatus.loading));

      if (isClosed) return;

      // final result = _commentRepo.sendComment();

      emit(state.copyWith(
          messages: [...state.messages, value],
          fetchStatus: FetchMessageStatus.success));
    } catch (_) {}
  }

  // void onSendCreatedPressed(
  //   IssuesModel issuesModel,
  // ) async {
  //   try {
  //     emit(state.copyWith(fetchStatus: FetchStatus.refreshing));

  //     //todo как менять уже созданные?
  //     final issue = state.issues[0]?.firstWhere((i) => i == issuesModel);

  //     if (issue == null) return;

  //     final report = IssueCreatedReport.fill(state, issue);

  //     //todo тут мы должны получать обновленную заявку
  //     await _roomRep.sendCreatedReport(report);

  //     // emit(state.copyWith(fetchStatus: FetchStatus.sendSuccess));
  //     // пока нужен т к .sendReport(report) ничего не возвращает
  //     await fetchRoom(state.room.roomId, refresh: true);
  //   } catch (_) {
  //     emit(state.copyWith(fetchStatus: FetchStatus.sendError));
  //   }
  // }
}
