import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_info.g.dart';

part 'status_info.freezed.dart';

@freezed
class StatusInfo with _$StatusInfo {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory StatusInfo({
    @JsonKey(name: 'id') required int id,
    required String fullName,
  }) = _StatusInfo;

  factory StatusInfo.fromJson(Map<String, dynamic> json) =>
      _$StatusInfoFromJson(json);
}
