part of 'voice_manager_cubit.dart';

@freezed
class VoiceManagerState with _$VoiceManagerState {
  const factory VoiceManagerState.initial({
    @Default(false) bool enableRecord,
    @Default(<VoiceValue>[]) List<VoiceValue> records,
  }) = _Initial;

  const VoiceManagerState._();

  List<VoiceValue> getRecordsByButtonId(String buttonId) =>
      [...records].where((e) => e.buttonId == buttonId).toList();
}
