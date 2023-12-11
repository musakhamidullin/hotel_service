import '../../../app/dio_client.dart';
import '../../../home/data/models/room.dart';
import '../models/department_info.dart';

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

    final deparments = (result.data as List<dynamic>)
        .map((e) => Department.fromJson(e))
        .toList();

    return deparments;
  }
}
