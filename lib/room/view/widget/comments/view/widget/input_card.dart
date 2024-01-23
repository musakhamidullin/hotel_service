import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/widgets/cash_memory_image_provider.dart';
import '../../../../../../voice_messenger/view/message_audio_player.dart';
import '../../cubit/comments_cubit.dart';
import '../../data/models/message_value.dart';
import 'footer_buttons.dart';

class InputCard extends StatefulWidget {
  const InputCard({super.key});

  @override
  State<InputCard> createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  final _textController = TextEditingController();
  var _messageValue = const MessageValue();

  var _canSend = false;
  final ValueNotifier<bool> _recording = ValueNotifier(false);

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder(
          valueListenable: _recording,
          builder: (context, recording, child) {
            return TextField(
              controller: _textController,
              keyboardType: TextInputType.multiline,
              maxLines: 2,
              enabled: !recording,
              decoration: const InputDecoration(
                filled: true,
              ),
              onChanged: (value) {
                _messageValue = _messageValue.copyWith(text: value);
                _canSend = _messageValue.canSend();
                if (_canSend) return;
                setState(() {});
              },
              onSubmitted: (value) {
                _messageValue = _messageValue.copyWith(text: value);
                context.read<CommentsCubit>().sendMessage(_messageValue);
                //todo clear after success send
                _textController.clear();
                _messageValue = _messageValue.copyWith(text: '');
                setState(() {
                  _canSend = _messageValue.canSend();
                });
                FocusManager.instance.primaryFocus?.unfocus();
              },
            );
          },
        ),
        if (_messageValue.buffImages.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _messageValue.buffImages
                    .map(
                      (e) => // Image(
                          Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              child: Image(
                                image: CacheMemoryImageProvider(
                                  tag: _messageValue.buffImages
                                      .indexOf(e)
                                      .toString(),
                                  img: e,
                                ),
                                fit: BoxFit.cover,
                                width: 90,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                final index =
                                    _messageValue.buffImages.indexOf(e);
                                setState(() {
                                  _messageValue = _messageValue.copyWith(
                                      buffImages: [..._messageValue.buffImages]
                                        ..removeAt(index));
                                });
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        SizedBox(height: _messageValue.buffImages.isEmpty ? 8 : 0),
        if (_messageValue.buffAudio.isNotEmpty)
          Column(
            children: _messageValue.buffAudio
                .map((e) => MessageAudioPlayer(
                      key: ObjectKey(e),
                      margin: const EdgeInsets.only(bottom: 8),
                      voiceValue: e,
                      index: _messageValue.buffAudio.indexOf(e),
                      playerKey: '${_messageValue.buffAudio.indexOf(e)}',
                      onRemove: (value) {
                        setState(() {
                          _messageValue = _messageValue.copyWith(
                              buffAudio: [..._messageValue.buffAudio]
                                ..removeAt(value));
                        });
                      },
                    ))
                .toList(),
          ),
        FooterButtons(
          canSend: _canSend,
          recording: _recording,
          onPhotographed: (value) {
            _messageValue = _messageValue
                .copyWith(buffImages: [...value, ..._messageValue.buffImages]);
            _canSend = _messageValue.canSend();

            setState(() {});
          },
          onAudioRecorded: (value) {
            _messageValue = _messageValue
                .copyWith(buffAudio: [..._messageValue.buffAudio, value]);

            _canSend = _messageValue.canSend();
            setState(() {});
          },
          onSend: () {
            context.read<CommentsCubit>().sendMessage(_messageValue);
            //todo clear after success send
            _textController.clear();

            _messageValue = const MessageValue();

            _canSend = _messageValue.canSend();
            FocusManager.instance.primaryFocus?.unfocus();
            setState(() {});
          },
          onClear: () {
            _textController.clear();

            _messageValue = const MessageValue();

            _canSend = _messageValue.canSend();
            FocusManager.instance.primaryFocus?.unfocus();
            setState(() {});
          },
        ),
      ],
    );
  }
}