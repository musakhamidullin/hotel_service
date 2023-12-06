import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_status_info.g.dart';

part 'room_status_info.freezed.dart';

@freezed
class RoomStatusInfo with _$RoomStatusInfo {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory RoomStatusInfo({
    @JsonKey(name: 'id') required int id,
    required String fullName,
  }) = _RoomStatusInfo;

  factory RoomStatusInfo.fromJson(Map<String, dynamic> json) =>
      _$RoomStatusInfoFromJson(json);
}
