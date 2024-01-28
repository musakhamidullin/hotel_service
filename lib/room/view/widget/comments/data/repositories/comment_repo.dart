import '../../../../../../app/dio_client.dart';
import '../models/message_value.dart';
import '../models/report_update.dart';

final class CommentRepo {
  Future<void> sendComment(ReportCleaningProblemUpdate report) async {
    await DioClient().dio.post('HouseKeeping/ReportCleaningProblemUpdate',
        data: report.toJson());
  }

  Future<(List<MessageValue> messages, int pages)> fetchComments(
      Map<String, dynamic> data) async {
    final result = await DioClient().dio.post<Map<String, dynamic>>(
        'HouseKeeping/PagedCommentListGet',
        data: data);

    if (result.data == null) throw Exception();

    final {
      'Data': {
        'hotelDefectMedias': List<dynamic> messages,
        'pageCount': double pages,
      },
    } = result.data!;

    return (
      messages.map((e) => MessageValue.fromJson(e)).toList(),
      pages.toInt(),
    );
  }
}
