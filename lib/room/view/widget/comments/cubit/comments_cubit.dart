import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/message_value.dart';
import '../data/models/paged_messages.dart';
import '../data/models/report_update.dart';
import '../repositories/comment_repo.dart';

part 'comments_state.dart';

part 'comments_cubit.freezed.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit({
    required this.commentRepo,
    required this.reportCleaningProblemUpdate,
  }) : super(CommentsState(
            reportCleaningProblemUpdate: reportCleaningProblemUpdate));

  final CommentRepo commentRepo;
  final ReportCleaningProblemUpdate reportCleaningProblemUpdate;

  var _currPage = 1;

  Map<String, dynamic> _toBody({required int defectId}) => {
        "Page": _currPage,
        "PageSize": 10,
        "DefectId": defectId,
      };

  Future<void> fetchMessages() async {
    if (isClosed) return;

    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      await Future.delayed(Duration(seconds: 2));
      final result = await commentRepo.fetchComments(
          _toBody(defectId: reportCleaningProblemUpdate.defectId));

      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          messages: result,
        ),
      );
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }

  Future<void> updatePagedMessage(PagedMessages pagedMessages) async {
    if (isClosed) return;
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
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      final result = commentRepo.sendComment(state.reportCleaningProblemUpdate);

      emit(state.copyWith(
          messages: [...state.messages, value],
          fetchStatus: FetchStatus.success));
    } catch (_) {}
  }
}
