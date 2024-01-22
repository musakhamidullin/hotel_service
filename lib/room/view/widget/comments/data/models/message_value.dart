import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_value.freezed.dart';

@freezed
class MessageValue with _$MessageValue {
  const factory MessageValue({
    String? text,
    List<Uint8List>? buffImages,
  }) = _MessageValue;

  const MessageValue._();

  bool canSend() =>
      (buffImages?.isNotEmpty ?? false) || (text?.isNotEmpty ?? false);
}