import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_value.freezed.dart';

@freezed
class MessageValue with _$MessageValue {
  const factory MessageValue({
    String? text,
    List<Object>? images,
}) = _MessageValue;
}
