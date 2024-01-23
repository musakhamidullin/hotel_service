import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../voice_messenger/data/models/voice_value.dart';
import '../../../../../data/models/issue_report.dart';

part 'message_value.freezed.dart';
part 'message_value.g.dart';


@freezed
class MessageValue with _$MessageValue {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory MessageValue({
    @JsonKey(includeFromJson: false)
    @Default(<Uint8List>[]) List<Uint8List> buffImages,
    @JsonKey(includeFromJson: false)
    @Default(<VoiceValue>[]) List<VoiceValue> buffAudio,
    @Default('') String text,
    @Default('') String date,
    @Default(0) int personId,
    @Default('') String personName,
    @Default(false) bool isEdited,
    @Default(<ProblemMedia>[]) List<ProblemMedia> medias,
  }) = _MessageValue;

  const MessageValue._();

  factory MessageValue.fromJson(Map<String, dynamic> json) => _$MessageValueFromJson(json);

  bool canSend() =>
      (buffImages?.isNotEmpty ?? false) ||
      (text?.isNotEmpty ?? false) ||
      (buffAudio?.isNotEmpty ?? false);
}