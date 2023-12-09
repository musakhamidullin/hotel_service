import '../../../app/dio_client.dart';
import '../../../home/data/models/room.dart';

final class RoomRep {
  Future<Room> fetchRoom(int roomId) async {
    final result = await DioClient()
        .post(path: 'HouseKeeping/RoomDetailGetGet?roomid=$roomId');
    if (result.data.isEmpty) throw Exception();

    return Room.fromJson(result.data);
  }
}
