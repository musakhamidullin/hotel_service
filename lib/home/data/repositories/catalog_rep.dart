import '../../../app/dio_client.dart';
import '../models/catalog_info.dart';
import '../models/status_info.dart';

class CatalogRep {
  var _cleanStatuses = <CatalogInfo>[];
  var _cleanTypes = <CatalogInfo>[];
  var _roomStatuses = <StatusInfo>[];

  List<CatalogInfo> get cleanStatuses => _cleanStatuses;
  List<CatalogInfo> get cleanTypes => _cleanTypes;
  List<StatusInfo> get roomStatuses => _roomStatuses;

  Future<void> fetchCleanStatuses() async {
    final result = await DioClient()
        .post<List<dynamic>>(path: 'HouseKeeping/CleanStatusesGet');
    if (result.data.isEmpty) throw Exception();

    _cleanStatuses = result.data.map((e) => CatalogInfo.fromJson(e)).toList();
  }

  Future<void> fetchCleanTypes(int ownerId) async {
    final result = await DioClient()
        .post<List<dynamic>>(path: 'HouseKeeping/CleaningTypesGet?ownerid=$ownerId');
    if (result.data.isEmpty) throw Exception();

    _cleanTypes = result.data.map((e) => CatalogInfo.fromJson(e)).toList();
  }

  Future<void> fetchRoomStatuses() async {
    final result = await DioClient()
        .post<List<dynamic>>(path: 'HouseKeeping/RoomStatusesListGet');
    if (result.data.isEmpty) throw Exception();

    _roomStatuses = result.data.map((e) => StatusInfo.fromJson(e)).toList();
  }
}
