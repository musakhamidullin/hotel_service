import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/data/models/room.dart';

part 'room_info.freezed.dart';
part 'room_info.g.dart';

@freezed
class RoomInfo with _$RoomInfo {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory RoomInfo({
    required Room data,
    // required dynamic errorCode,
    // required dynamic user,
  }) = _RoomInfo;

  factory RoomInfo.fromJson(Map<String, dynamic> json) =>
      _$RoomInfoFromJson(json);
}
