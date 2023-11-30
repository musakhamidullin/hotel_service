import '../../../app/dio_client.dart';
import '../models/room.dart';

class HotelRep {
  Future<(List<Room> data, int pages)> fetchHotel({
    required int page,
    required int ownerId,
  }) async {
    final result = await DioClient().post<Map<String, dynamic>>(
      path: 'HouseKeeping/PagedRoomdListGet',
      data: {
        "Page": page,
        "PageSize": 10,
        "RoomNumber": "",
        "OwnerId": ownerId,
      },
    );
    final rooms = result.data['rooms'] as List<dynamic>?;
    if (rooms?.isEmpty ?? true) throw Exception();

    final data = rooms!.map((e) => Room.fromJson(e)).toList();
    final pages = result.data['pageCount'] as int;
    return (data, pages);
  }
}
