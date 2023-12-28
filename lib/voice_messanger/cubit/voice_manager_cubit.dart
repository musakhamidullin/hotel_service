import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

part 'voice_manager_cubit.freezed.dart';

part 'voice_manager_state.dart';

class VoiceManagerCubit extends Cubit<VoiceManagerState> {
  VoiceManagerCubit() : super(const VoiceManagerState.initial()) {
    _initRecord().then((hasPermission) {
      if (hasPermission) emit(state.copyWith(enableRecord: true));
    });
  }

  final _recorder = AudioRecorder();
  final _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);

  AudioPlayer get audioPlayer => _audioPlayer;

  int _currentlyPlayingIndex = -1;

  int get currentlyPlayingIndex => _currentlyPlayingIndex;

  Future<String> _getPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return join(
      dir.path,
      'audio_${DateTime.now().millisecondsSinceEpoch}.m4a',
    );
  }

  Future<bool> _initRecord() async {
    return await _recorder.hasPermission();
  }

  Future<void> record() async {
    final path = await _getPath();
    await _recorder.start(const RecordConfig(), path: path);
  }

  Future<String> stopRecord({String duration = ''}) async {
    final path = await _recorder.stop();
    if (path == null) return '';

    final bytes = File(path).readAsBytesSync();
    await File(path).delete();
    return base64Encode(bytes);
  }

  Future<void> playMessageFromBytes({required String base64, required int index}) async {
    _currentlyPlayingIndex = index;
    await _audioPlayer.play(BytesSource(base64Decode(base64)));
  }

  Future<void> stopPlayingMessage() async {
    await _audioPlayer.pause();
  }

  @override
  Future<void> close() async {
    _recorder.dispose();
    _audioPlayer.dispose();
    return super.close();
  }
}
