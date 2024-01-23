import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../../../../voice_messenger/data/models/voice_value.dart';
import '../../../../../data/models/issue_report.dart';

part 'message_value.freezed.dart';

part 'message_value.g.dart';

@freezed
class MessageValue with _$MessageValue {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory MessageValue({
    @JsonKey(includeFromJson: false)
    @Default(<Uint8List>[])
    List<Uint8List> buffImages,
    @JsonKey(includeFromJson: false)
    @Default(<VoiceValue>[])
    List<VoiceValue> buffAudio,
    @Default('') String text,
    DateTime? date,
    @Default(0) int personId,
    @Default('') String personName,
    @Default(false) bool isEdited,
    @Default(<ProblemMedia>[]) List<ProblemMedia> medias,
  }) = _MessageValue;

  const MessageValue._();

  factory MessageValue.fromJson(Map<String, dynamic> json) =>
      _$MessageValueFromJson(json);

  String dateFormatted(String languageCode) =>
      DateFormat.yMEd(languageCode).add_Hm().format(date!);

  bool canSend() =>
      buffImages.isNotEmpty || text.isNotEmpty || buffAudio.isNotEmpty;
}
