import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../voice_messenger/data/models/voice_value.dart';

part 'message_value.freezed.dart';

@freezed
class MessageValue with _$MessageValue {
  const factory MessageValue({
    String? text,
    List<Uint8List>? buffImages,
    List<VoiceValue>? buffAudio,
  }) = _MessageValue;

  const MessageValue._();

  bool canSend() =>
      (buffImages?.isNotEmpty ?? false) ||
      (text?.isNotEmpty ?? false) ||
      (buffAudio?.isNotEmpty ?? false);
}
