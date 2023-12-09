import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../data/models/voice_value.dart';

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

  String _currentlyPlayingFile = '';

  String get currentlyPlayingFile => _currentlyPlayingFile;

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

  Future<void> stopRecord({String buttonId = '', String duration = ''}) async {
    final path = await _recorder.stop();
    if (path == null) return;

    emit(
      state.copyWith(
        records: [
          VoiceValue(
            filePath: path,
            buttonId: buttonId,
            duration: duration,
          ),
          ...state.records
        ],
      ),
    );
  }

  Future<void> playMessage(String filePath) async {
    _currentlyPlayingFile = filePath;
    await _audioPlayer.play(DeviceFileSource(filePath));
  }

  Future<void> stopPlayingMessage() async {
    await _audioPlayer.pause();
  }

  Future<void> removeMessage(String path) async {
    try {
      await File(path).delete();
      emit(
        state.copyWith(
          records: [...state.records]..removeWhere((e) => e.filePath == path),
        ),
      );
    } catch (_) {}
  }

  Future<void> _removeFiles() async {
    try {
      for (final message in state.records) {
        await File(message.filePath).delete();
      }
    } catch (_) {}
  }

  @override
  Future<void> close() async {
    await _removeFiles();
    _recorder.dispose();
    _audioPlayer.dispose();
    return super.close();
  }
}
