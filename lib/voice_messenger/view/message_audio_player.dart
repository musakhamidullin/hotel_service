import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/voice_manager_cubit.dart';
import '../data/models/voice_value.dart';

class MessageAudioPlayer extends StatefulWidget {
  const MessageAudioPlayer({
    super.key,
    required this.voiceValue,
    required this.playerKey,
    required this.onRemove,
    required this.index,
    this.margin,
  });

  final EdgeInsetsGeometry? margin;
  final VoiceValue voiceValue;
  final String playerKey;
  final Function(int) onRemove;
  final int index;

  @override
  State<MessageAudioPlayer> createState() => _MessageAudioPlayerState();
}

class _MessageAudioPlayerState extends State<MessageAudioPlayer> {
  PlayerState _playerState = PlayerState.stopped;

  // should not be 0
  Duration _duration = const Duration(milliseconds: 1000);
  Duration _position = const Duration();

  var _progress = 0.0;

  late final StreamSubscription<PlayerState> _onPlayerStateChanged;
  late final StreamSubscription<Duration> _onDurationChanged;
  late final StreamSubscription<Duration> _onPositionChanged;

  @override
  void initState() {
    super.initState();
    final managerCubit = context.read<VoiceManagerCubit>();
    _onPlayerStateChanged =
        managerCubit.audioPlayer.onPlayerStateChanged.listen((event) {
      if (managerCubit.currentlyPlayerKey != widget.playerKey) {
        if (_playerState != PlayerState.stopped) {
          setState(() => _playerState = PlayerState.stopped);
        }
        return;
      }

      setState(() => _playerState = event);
    });
    _onDurationChanged =
        managerCubit.audioPlayer.onDurationChanged.listen((event) {
      if (managerCubit.currentlyPlayerKey != widget.playerKey) {
        return;
      }
      _duration = event;
    });
    _onPositionChanged =
        managerCubit.audioPlayer.onPositionChanged.listen((event) {
      if (managerCubit.currentlyPlayerKey != widget.playerKey) {
        if (_position.inMilliseconds != 0) {
          setState(() {
            _position = const Duration();
            _progress = 0;
          });
        }
        return;
      }
      setState(() => _position = event);
    });
  }

  @override
  void dispose() {
    _onPlayerStateChanged.cancel();
    _onDurationChanged.cancel();
    _onPositionChanged.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_playerState == PlayerState.playing) {
      _progress = _position.inMilliseconds / _duration.inMilliseconds;
    }

    if (_playerState == PlayerState.completed) {
      _progress = 1.0;
    }
    return Card(
      elevation: 6,
      margin: widget.margin,
      child: Stack(
        children: [
          Row(
            children: [
              IconButton(
                iconSize: 40,
                onPressed: () async {
                  if (_playerState != PlayerState.playing) {
                    widget.voiceValue.audio.isFromApi
                        ? await context
                            .read<VoiceManagerCubit>()
                            .playMessageFromApi(
                              url: widget.voiceValue.audio.audio,
                              playerKey: widget.playerKey,
                            )
                        : await context
                            .read<VoiceManagerCubit>()
                            .playMessageFromBytes(
                              base64: widget.voiceValue.audio.audio,
                              playerKey: widget.playerKey,
                            );
                  } else {
                    await context
                        .read<VoiceManagerCubit>()
                        .stopPlayingMessage();
                  }
                },
                icon: Icon(_playerState == PlayerState.playing
                    ? Icons.pause_circle_filled_rounded
                    : Icons.play_circle_fill_rounded),
              ),
              Expanded(
                child: LinearProgressIndicator(
                  value: _progress,
                ),
              ),
              IconButton(
                onPressed: () {
                  widget.onRemove(widget.index);
                },
                icon: const Icon(Icons.delete_outline_rounded),
              ),
            ],
          ),
          Positioned.fill(
            bottom: 4,
            right: 48,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(widget.voiceValue.duration),
            ),
          ),
        ],
      ),
    );
  }
}
