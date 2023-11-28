import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.g.dart';

part 'room.freezed.dart';

@freezed
class Room with _$Room {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory Room({
    required int id,
    required String floor,
    required int cleanStatusId,
    required int cleaningType,
    required String roomNumber,
    required bool roomStatus,
}) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
