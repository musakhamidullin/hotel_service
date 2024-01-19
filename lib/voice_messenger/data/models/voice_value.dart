import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_value.freezed.dart';

@freezed
class VoiceValue with _$VoiceValue {
  const factory VoiceValue({
    @Default('') String base64,
    @Default('') String buttonId,
    @Default('') String duration,
}) = _VoiceValue;
}
