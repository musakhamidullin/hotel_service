import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_value.freezed.dart';

@freezed
class VoiceValue with _$VoiceValue {
  const factory VoiceValue({
    required String filePath,
    @Default('') String buttonId,
    @Default('') String duration,
}) = _VoiceValue;
}
