import '../../../app/dio_client.dart';
import '../models/room.dart';

class HotelRep {
  Future<List<Room>> fetchHotel() async {
    final result = await DioClient().post<Map<String, dynamic>>(
      path: 'HouseKeeping/PagedRoomdListGet',
      data: {
        "Page": 1,
        "PageSize": 20,
        "RoomNumber": "",
        "OwnerId": 1366,
      },
    );
    final rooms = result.data['rooms'] as List<dynamic>?;
    if (rooms?.isEmpty ?? true) throw Exception();
    return rooms!.map((e) => Room.fromJson(e)).toList();
  }
}
