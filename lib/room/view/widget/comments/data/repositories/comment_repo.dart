import '../../../../../../app/dio_client.dart';
import '../models/message_value.dart';
import '../models/page_data.dart';
import '../models/report_update.dart';

final class CommentRepo {
  Future<void> sendComment(ReportCleaningProblemUpdate report) async {
    await DioClient().dio.post('HouseKeeping/ReportCleaningProblemUpdate',
        data: report.toJson());
  }

  Future<List<MessageValue>> fetchComments(Map<String, dynamic> data) async {
    final result = await DioClient()
        .dio
        .post('HouseKeeping/PagedCommentListGet', data: data);

    if (result.data.isEmpty) throw Exception();

    final messages = PageMessagesData.fromJson(result.data).data;

    return messages;
  }
}
