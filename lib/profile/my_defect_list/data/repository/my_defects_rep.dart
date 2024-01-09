import '../../../../app/dio_client.dart';
import '../../../../room/data/models/defect.dart';
import '../../../../room/data/models/defect_status.dart';
import '../../../../room/data/models/department_info.dart';
import '../../../../room/data/models/issues.dart';

class MyDefectsRep {
  Future<List<IssuesModel>> fetchMyDefectList(
      Map<String, dynamic> data, int ownerId) async {
    final result = await DioClient().post<List<dynamic>?>(
        path: 'HouseKeeping/GetMyCreateDefectsList', data: data);

    final departments = await _fetchDepartment(ownerId);
    final defectStatuses = await _fetchDefectStatus(ownerId);

    return result.data
        ?.map((e) => IssuesModel.filledByDefect(
            Defect.fromJson(e as Map<String, dynamic>),
            departments,
            defectStatuses))
        .toList() ?? [];
  }

  Future<List<Department>> _fetchDepartment(int ownerId) async {
    final result = await DioClient()
        .post(path: 'HouseKeeping/DepartmentListGet?ownerid=$ownerId');
    if (result.data.isEmpty) throw Exception();

    final departments = (result.data as List<dynamic>)
        .map((e) => Department.fromJson(e))
        .toList();

    return departments;
  }

  Future<List<DefectStatus>> _fetchDefectStatus(int ownerId) async {
    final result = await DioClient()
        .post(path: 'HouseKeeping/DefectStatusesGet?ownerid=$ownerId');
    if (result.data.isEmpty) throw Exception();

    final statuses = (result.data as List<dynamic>)
        .map((e) => DefectStatus.fromJson(e))
        .toList();

    return statuses;
  }
}
