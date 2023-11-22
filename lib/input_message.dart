import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class InputMessage extends StatefulWidget {
  const InputMessage({Key? key}) : super(key: key);

  @override
  State<InputMessage> createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  final _speechToText = SpeechToText();
  bool _speechEnabled = false;
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  @override
  void dispose() {
    _textController.dispose();
    _speechToText.cancel();
    super.dispose();
  }

  /// This has to happen only once per app
  void _initSpeech() {
    _speechToText.initialize().then((value) {
      setState(() {
        _speechEnabled = value;
      });
    });
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(
      onResult: _onSpeechResult,
      localeId: 'ru',
    );
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    _textController.text = result.recognizedWords;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        autofocus: true,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: const InputDecoration(filled: true),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _ClearButton(
                          controller: _textController,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        _RecordButton(
                          enable: _speechEnabled,
                          onStartListen: _startListening,
                          onStopListen: _stopListening,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        _SendButton(
                          controller: _textController,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: controller.clear,
      icon: const Icon(Icons.close),
    );
  }
}

class _SendButton extends StatefulWidget {
  const _SendButton({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<_SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<_SendButton> {
  var _enableButton = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_showButton);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_showButton);
    super.dispose();
  }

  void _showButton() {
    setState(() {
      _enableButton = widget.controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _enableButton ? () {} : null,
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(_enableButton ? 1.0 : 0.5),
              shape: BoxShape.circle),
          child: const Icon(
            Icons.send,
            color: Colors.white,
          )),
    );
  }
}

class _RecordButton extends StatefulWidget {
  const _RecordButton({
    required this.onStartListen,
    required this.onStopListen,
    required this.enable,
  });

  final Function() onStartListen;
  final Function() onStopListen;
  final bool enable;

  @override
  State<_RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<_RecordButton> {
  var _recording = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: widget.enable
          ? (_) {
        widget.onStartListen();
        setState(() {
          _recording = true;
        });
      }
          : null,
      onTapUp: widget.enable
          ? (_) {
        widget.onStopListen();
        setState(() {
          _recording = false;
        });
      }
          : null,
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(widget.enable ? 1.0 : 0.5),
              shape: BoxShape.circle),
          child: Icon(
            _recording ? Icons.mic_off : Icons.mic,
            color: Colors.white,
          )),
    );
  }
}