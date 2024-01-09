import 'package:flutter/material.dart';

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
    final localizations = Localizations.localeOf(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                        issuesModel.dateFormatted(localizations.languageCode)),
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
              if (issuesModel.lastComment.isNotEmpty) Text(issuesModel.lastComment),
            ],
          ),
        ),
      ),
    );
  }
}
