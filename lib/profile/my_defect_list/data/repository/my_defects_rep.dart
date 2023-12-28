import '../../../../app/dio_client.dart';
import '../../../../room/data/models/defect.dart';
import '../../../../room/data/models/issues.dart';

class MyDefectsRep {
  Future<List<IssuesModel>> fetchMyDefectList(Map<String, dynamic> data) async {
    final result = await DioClient().post<List<dynamic>>(
        path: 'HouseKeeping/GetMyCreateDefectsList', data: data);
    return result.data
        .map((e) => IssuesModel.filledByDefect(Defect.fromJson(e as Map<String, dynamic>)))
        .toList();
  }
}
