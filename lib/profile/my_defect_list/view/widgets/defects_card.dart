import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../room/data/models/issues.dart';
import '../../../../room/view/widget/mini_images.dart';
import '../../../../voice_messanger/data/models/voice_value.dart';
import '../../../../voice_messanger/view/message_audio_player.dart';

class DefectsCard extends StatelessWidget {
  const DefectsCard({
    super.key,
    required this.issuesModel,
    required this.index,
  });

  final IssuesModel issuesModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = Localizations.localeOf(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  // TODO нужно получать номер заявки
                  child: Text(
                    '${issuesModel.dateFormatted(localizations.languageCode)}, №1337228',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            if (issuesModel.images.isNotEmpty)
              Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  MiniImagesIssueCard(
                    index: index,
                    images: issuesModel.images,
                    onChanged: (List<String> items) {},
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            Column(
              children: issuesModel.audios
                  .map(
                    (e) => MessageAudioPlayer(
                      key: ObjectKey(e),
                      voiceValue: VoiceValue(base64: e),
                      index: issuesModel.audios.indexOf(e),
                      playerKey: '$index${issuesModel.audios.indexOf(e)}',
                      onRemove: (value) {},
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
