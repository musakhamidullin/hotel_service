part of 'voice_manager_cubit.dart';

@freezed
class VoiceManagerState with _$VoiceManagerState {
  const factory VoiceManagerState.initial({
    @Default(false) bool enableRecord,
  }) = _Initial;

  const VoiceManagerState._();
}
