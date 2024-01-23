import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/voice_manager_cubit.dart';
import 'record_timer.dart';

class RecordButton extends StatefulWidget {
  const RecordButton({
    super.key,
    required this.onRecord,
    required this.onStop,
  });

  final Function(bool) onRecord;
  final Function(String) onStop;

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  var _recording = false;
  var _duration = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoiceManagerCubit, VoiceManagerState>(
      builder: (context, state) {
        if (!state.enableRecord) return const SizedBox.shrink();
        return Stack(
          alignment: Alignment.centerRight,
          children: [
            SizedBox.square(
              dimension: 50,
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onTap: () async {
                  setState(() {
                    _recording = !_recording;
                  });

                  if (_recording) {
                    context.read<VoiceManagerCubit>().record();
                  } else {
                    final path = await context
                        .read<VoiceManagerCubit>()
                        .stopRecord(duration: _duration);

                    if (path.isNotEmpty) widget.onStop(path);
                  }
                  widget.onRecord(_recording);
                },
                child: Icon(
                  _recording ? Icons.stop_circle_rounded : Icons.mic,
                  color: _recording ? Colors.red : null,
                  size: 34,
                ),
              ),
            ),
            if (_recording)
              Transform.translate(
                offset: const Offset(-70, 0),
                child: RecordTimer(
                  onDurationChanged: (value) {
                    _duration = value;
                  },
                ),
              )
          ],
        );
      },
    );
  }
}