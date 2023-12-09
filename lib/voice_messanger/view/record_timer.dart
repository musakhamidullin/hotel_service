import 'dart:async';

import 'package:flutter/material.dart';

class RecordTimer extends StatefulWidget {
  const RecordTimer({
    super.key,
    required this.onDurationChanged,
  });

  final Function(String) onDurationChanged;

  @override
  State<RecordTimer> createState() => _RecordTimerState();
}

class _RecordTimerState extends State<RecordTimer> {
  late Timer _timer;
  var _counter = 0;
  var _duration = '00:00';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        _counter++;
        final minutes = '${_counter ~/ 60}'.padLeft(2, '0');
        final seconds = '${_counter % 60}'.padLeft(2, '0');
        setState(() {
          _duration = '$minutes:$seconds';
        });
        widget.onDurationChanged(_duration);
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.mic,
          color: Colors.red,
          size: 34,
        ),
        const SizedBox(width: 8),
        Text(
          _duration,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
