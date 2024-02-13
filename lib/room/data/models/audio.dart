import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio.freezed.dart';

part 'audio.g.dart';

@freezed
class AudioModel with _$AudioModel {
  const factory AudioModel({
    @Default(false) bool isFromApi,//todo check by key word 'http'
    @Default('') String audio,
  }) = _AudioModel;

  factory AudioModel.fromApi(String audio) =>
      AudioModel(isFromApi: true, audio: audio);

  factory AudioModel.fromDevice(String audio) => AudioModel(audio: audio);

  factory AudioModel.fromJson(Map<String, dynamic> json) =>
      _$AudioModelFromJson(json);
}
