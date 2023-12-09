import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/voice_manager_cubit.dart';
import 'record_timer.dart';

class RecordButton extends StatefulWidget {
  const RecordButton({
    super.key,
    required this.id,
  });

  final String id;

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
            Card(
              child: SizedBox(
                height: 70,
                width: 70,
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTapDown: (_) async {
                    context.read<VoiceManagerCubit>().record();
                    setState(() => _recording = true);
                  },
                  onTapUp: (_) async {
                    context.read<VoiceManagerCubit>().stopRecord(
                          buttonId: widget.id,
                          duration: _duration,
                        );
                    setState(() => _recording = false);
                  },
                  child: Icon(
                    _recording ? Icons.mic_off_rounded : Icons.mic,
                    size: 34,
                  ),
                ),
              ),
            ),
            if (_recording)
              Transform.translate(
                offset: const Offset(-100, 0),
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