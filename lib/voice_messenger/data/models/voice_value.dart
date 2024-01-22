import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../room/data/models/audio.dart';

part 'voice_value.freezed.dart';

@freezed
class VoiceValue with _$VoiceValue {
  const factory VoiceValue({
    @Default(AudioModel()) AudioModel audio,
    @Default('') String buttonId,
    @Default('') String duration,
}) = _VoiceValue;
}
