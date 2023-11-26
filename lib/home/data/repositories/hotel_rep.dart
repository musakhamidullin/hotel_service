import '../models/room.dart';

class HotelRep {
  Future<List<Room>> fetchHotel() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Room(id: 1, floor: 1, status: 'status', number: 1),
      Room(id: 2, floor: 1, status: 'status', number: 2),
      Room(id: 3, floor: 2, status: 'status', number: 3),
      Room(id: 4, floor: 2, status: 'status', number: 4),
      Room(id: 5, floor: 2, status: 'status', number: 5),
      Room(id: 6, floor: 3, status: 'status', number: 6),
      Room(id: 7, floor: 2, status: 'status', number: 7),
      Room(id: 8, floor: 2, status: 'status', number: 8),
      Room(id: 9, floor: 2, status: 'status', number: 9),
      Room(id: 10, floor: 4, status: 'status', number: 10),
      Room(id: 11, floor: 2, status: 'status', number: 11),
      Room(id: 12, floor: 2, status: 'status', number: 12),
      Room(id: 13, floor: 5, status: 'status', number: 13),
      Room(id: 14, floor: 2, status: 'status', number: 14),
    ];
  }
}
