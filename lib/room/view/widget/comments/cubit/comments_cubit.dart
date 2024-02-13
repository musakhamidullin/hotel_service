import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../auth/data/model/user.dart';
import '../../../../data/models/issue_report.dart';
import '../data/models/message_value.dart';
import '../data/models/report_update.dart';
import '../data/repositories/comment_repo.dart';

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
  var _pages = 0;

  Map<String, dynamic> _toBody({required int defectId}) => {
        "Page": _currPage,
        "PageSize": 15,
        "DefectId": defectId,
      };

  Future<void> fetchFirstPage() async {
    try {
      _currPage = 1;

      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      final (messages, pages) = await commentRepo.fetchComments(
          _toBody(defectId: reportCleaningProblemUpdate.defectId));

      _pages = pages;

      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          messages: messages,
        ),
      );
    } catch (_, t) {
      print(t);
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }

  Future<void> fetchNewPage() async {
    try {
      if (_currPage >= _pages) return;
      _currPage++;

      emit(state.copyWith(fetchStatus: FetchStatus.paging));

      final (messages, _) = await commentRepo.fetchComments(
          _toBody(defectId: reportCleaningProblemUpdate.defectId));

      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          messages: [...state.messages, ...messages],
        ),
      );
    } catch (_, t) {
      print(t);
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }

  Future<FetchStatus> sendMessage(MessageValue value) async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      final media = [
        ...value.pathOfImages.map((e) => ProblemMedia.fromFilePath(e)).toList(),
        ...value.buffAudio
            .map((e) => ProblemMedia.fromAudioBytes(e.audio.audio))
            .toList(),
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
