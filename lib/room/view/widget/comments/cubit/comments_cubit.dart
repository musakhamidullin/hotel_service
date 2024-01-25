import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../auth/data/model/user.dart';
import '../../../../data/models/issue_report.dart';
import '../data/models/message_value.dart';
import '../data/models/report_update.dart';
import '../repositories/comment_repo.dart';

part 'comments_state.dart';

part 'comments_cubit.freezed.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit({
    required this.commentRepo,
    required this.reportCleaningProblemUpdate,
    required this.user,
  }) : super(const CommentsState());

  final CommentRepo commentRepo;
  final ReportCleaningProblemUpdate reportCleaningProblemUpdate;
  final User user;

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
      final media = [
        ...value.buffImages.map((e) => ProblemMedia.fromBytes(e)).toList(),
        ...value.buffAudio.map((e) => ProblemMedia.fromFile(e.audio.audio, MediaType.m4a)).toList(),
      ];
      final report = reportCleaningProblemUpdate.copyWith(
        comment: value.text,
        problemMedia: media,
      );
      await commentRepo.sendComment(report);

      emit(state.copyWith(
        fetchStatus: FetchStatus.success,
        messages: [
          value.copyWith(personName: user.personInfo.fullName()),
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
