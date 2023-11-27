import '../../../app/dio_client.dart';
import '../models/clean_status.dart';

class CatalogRep {
  var cleanStatuses = <CleanStatus>[];

  Future<void> fetchCleanStatuses() async {
    final result = await DioClient()
        .post<List<dynamic>>(path: 'HouseKeeping/CleanStatusesGet');
    if (result.data.isEmpty) throw Exception();

    final statuses = result.data.map((e) => CleanStatus.fromJson(e)).toList();
    cleanStatuses = statuses;
  }
}
