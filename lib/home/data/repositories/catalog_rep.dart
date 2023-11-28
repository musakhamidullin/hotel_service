import '../../../app/dio_client.dart';
import '../models/catalog_info.dart';

class CatalogRep {
  var _cleanStatuses = <CatalogInfo>[];
  var _cleanTypes = <CatalogInfo>[];

  List<CatalogInfo> get cleanStatuses => _cleanStatuses;
  List<CatalogInfo> get cleanTypes => _cleanTypes;

  Future<void> fetchCleanStatuses() async {
    final result = await DioClient()
        .post<List<dynamic>>(path: 'HouseKeeping/CleanStatusesGet');
    if (result.data.isEmpty) throw Exception();

    final data = result.data.map((e) => CatalogInfo.fromJson(e)).toList();
    _cleanStatuses = data;
  }

  Future<void> fetchCleanTypes(int ownerId) async {
    final result = await DioClient()
        .post<List<dynamic>>(path: 'HouseKeeping/CleaningTypesGet?ownerid=$ownerId');
    if (result.data.isEmpty) throw Exception();

    final data = result.data.map((e) => CatalogInfo.fromJson(e)).toList();
    _cleanTypes = data;
  }
}
