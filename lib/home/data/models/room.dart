import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.g.dart';

part 'room.freezed.dart';

@freezed
class Room with _$Room {
  const factory Room({
    required int id,
    required int floor,
    required String status,
    required int number,
}) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
