import 'package:freezed_annotation/freezed_annotation.dart';

part 'clean_status.freezed.dart';

part 'clean_status.g.dart';

@freezed
class CleanStatus with _$CleanStatus {
  const factory CleanStatus({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'ShortDesc') required String shortDesc,
    @JsonKey(name: 'LongDesc') required String longDesc,
  }) = _CleanStatus;

  factory CleanStatus.fromJson(Map<String, dynamic> json) =>
      _$CleanStatusFromJson(json);
}
