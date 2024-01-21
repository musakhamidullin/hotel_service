import 'package:flutter/material.dart';

import '../../data/models/message_value.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.messageValue,
  });

  final MessageValue messageValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        if (messageValue.text != null) Text(messageValue.text!),
        const SizedBox(height: 12),
      ],
    );
  }
}
