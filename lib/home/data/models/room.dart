import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../room/data/models/defect.dart';

part 'room.g.dart';

part 'room.freezed.dart';

@freezed
class Room with _$Room {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory Room({
    @Default(0) int id,
    @Default(0) int floor,
    @Default(0) int cleanStatusId,
    @Default(0) int cleaningType,
    @Default(0) int roomStatusId,
    @Default('') String roomNumber,
    @Default('') String roomStatus,
    @Default('') String roomType,
    @Default(0) int roomId,
    @Default('') String cleanStatusName,
    @Default('') String cleaningTypeName,
    @Default('') @DateSerializer() String arrdate,
    @Default('') @DateSerializer() String depdate,
    @Default([])
    List<Defect> defects,
    // dynamic notes,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}

class DateSerializer implements JsonConverter<String, dynamic> {
  const DateSerializer();

  @override
  String fromJson(json) => '${DateTime.tryParse(json) ?? DateTime.now()}';

  @override
  toJson(String object) => Never;
}
