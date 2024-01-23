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
    final theme = Theme.of(context);
    final localizations = Localizations.localeOf(context);
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 2, right: 2, top: 2),
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 6, offset: Offset(0, 8))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (messageValue.text.isNotEmpty)
              Text(
                messageValue.text,
                textAlign: TextAlign.right,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 130,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      messageValue.personName,
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.black54),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  messageValue.dateFormatted(localizations.languageCode),
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
