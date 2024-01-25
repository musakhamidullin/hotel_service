import 'package:flutter/material.dart';

import '../../../../../../common/widgets/cash_memory_image_provider.dart';
import '../../../../../../voice_messenger/view/message_audio_player.dart';
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
            if (messageValue.text.isNotEmpty)
              Text(
                messageValue.text,
                textAlign: TextAlign.right,
              ),
            if (messageValue.buffImages.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: messageValue.buffImages
                      .map(
                        (e) => SizedBox.square(
                          dimension: 100,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            child: Image(
                              image: CacheMemoryImageProvider(
                                tag: messageValue.buffImages
                                    .indexOf(e)
                                    .toString(),
                                img: e,
                              ),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            if (messageValue.buffAudio.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  children: messageValue.buffAudio
                      .map((e) => MessageAudioPlayer(
                            key: ObjectKey(e),
                            margin: const EdgeInsets.only(bottom: 8),
                            voiceValue: e,
                            index: messageValue.buffAudio.indexOf(e),
                            playerKey: '${messageValue.buffAudio.indexOf(e)}',
                            onRemove: (value) {},
                          ))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
