import 'package:flutter/material.dart';

import '../../../app/dio_client.dart';
import '../../../home/data/models/room.dart';
import '../models/defect_status.dart';
import '../models/department_info.dart';
import '../models/issue_report.dart';
import '../models/reports.dart';

final class RoomRep {
  Future<Room> fetchRoom(int roomId) async {
    final result = await DioClient()
        .post(path: 'HouseKeeping/RoomDetailGetGet?roomid=$roomId');
    if (result.data.isEmpty) throw Exception();

    return Room.fromJson(result.data);
  }

  Future<List<Department>> fetchDepartment(int ownerId) async {
    final result = await DioClient()
        .post(path: 'HouseKeeping/DepartmentListGet?ownerid=$ownerId');
    if (result.data.isEmpty) throw Exception();

    final departments = (result.data as List<dynamic>)
        .map((e) => Department.fromJson(e))
        .toList();

    return departments;
  }

  Future<List<DefectStatus>> fetchDefectStatus(int ownerId) async {
    final result = await DioClient()
        .post(path: 'HouseKeeping/DefectStatusesGet?ownerid=$ownerId');
    if (result.data.isEmpty) throw Exception();

    final statuses = (result.data as List<dynamic>)
        .map((e) => DefectStatus.fromJson(e))
        .toList();

    return statuses;
  }

  Future<void> sendReport(IssueReport report) async {
    await DioClient()
        .dio
        .post('HouseKeeping/ReportCleaningProblem', data: report.toJson());
  }

  Future<void> sendReports(Reports reports) async {
    final data = reports.toJson();

    final result = await DioClient()
        .post(path: 'HouseKeeping/ReportCleaningListProblem', data: data);
    debugPrint(result.toString());
  }
}
