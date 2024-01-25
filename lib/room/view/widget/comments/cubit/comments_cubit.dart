import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/message_value.dart';
import '../data/models/report_update.dart';
import '../repositories/comment_repo.dart';

part 'comments_state.dart';

part 'comments_cubit.freezed.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit({
    required this.commentRepo,
    required this.reportCleaningProblemUpdate,
  }) : super(const CommentsState());

  final CommentRepo commentRepo;
  final ReportCleaningProblemUpdate reportCleaningProblemUpdate;

  var _currPage = 0;

  Map<String, dynamic> _toBody({required int defectId}) => {
        "Page": _currPage,
        "PageSize": 15,
        "DefectId": defectId,
      };

  Future<void> fetchMessages({bool firstPage = false}) async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      if (firstPage) _currPage = 0;

      _currPage++;

      final result = await commentRepo.fetchComments(
          _toBody(defectId: reportCleaningProblemUpdate.defectId));

      if (result.isEmpty) {
        return emit(
          state.copyWith(
            fetchStatus: FetchStatus.success,
          ),
        );
      }

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

  Future<FetchStatus> sendMessage(MessageValue value) async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      final report = ReportCleaningProblemUpdate(
        personId: reportCleaningProblemUpdate.personId,
        defectId: reportCleaningProblemUpdate.defectId,
        departmentId: reportCleaningProblemUpdate.departmentId,
        comment: value.text,
      );
      await commentRepo.sendComment(report);

      emit(state.copyWith(
        fetchStatus: FetchStatus.success,
        messages: [
          value,
          ...state.messages,
        ],
      ));
      return FetchStatus.success;
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
      return FetchStatus.failure;
    }
  }
}
