import '../../../app/dio_client.dart';
import '../models/room.dart';

class HotelRep {
  Future<(List<Room> data, int pages)> fetchHotel({
    required Map<String, dynamic> body,
  }) async {
    final result = await DioClient().post<Map<String, dynamic>>(
      path: 'HouseKeeping/PagedRoomdListGet',
      data: body,
    );
    final rooms = result.data['rooms'] as List<dynamic>?;

    final data = rooms!.map((e) => Room.fromJson(e)).toList();
    final pages = result.data['pageCount'] as int;
    return (data, pages);
  }
}
