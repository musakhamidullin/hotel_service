import '../../../../../app/dio_client.dart';
import '../data/models/paged_messages.dart';
import '../data/models/report_update.dart';

final class CommentRepo {
  Future<void> sendComment(ReportCleaningProblemUpdate report) async {
    await DioClient().dio.post('HouseKeeping/ReportCleaningProblemUpdate',
        data: report.toJson());
  }

  Future<void> fetchComments(PagedMessages pagedMessages) async {
    await DioClient()
        .dio
        .post('HouseKeeping/PagedCommentListGet', data: pagedMessages.toJson());
  }
}
