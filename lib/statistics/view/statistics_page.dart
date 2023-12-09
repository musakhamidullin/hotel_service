import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../voice_messanger/cubit/voice_manager_cubit.dart';
import '../../voice_messanger/view/message_audio_player.dart';
import '../../voice_messanger/view/record_button.dart';

@RoutePage()
class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    const buttonGroupId = '1';
    return BlocProvider(
      create: (context) => VoiceManagerCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<VoiceManagerCubit, VoiceManagerState>(
            builder: (context, state) {
              return ListView(
                children: state
                    .getRecordsByButtonId(buttonGroupId)
                    .map(
                      (e) =>
                          MessageAudioPlayer(key: ObjectKey(e), voiceValue: e),
                    )
                    .toList(),
              );
            },
          ),
        ),
        floatingActionButton: const RecordButton(id: buttonGroupId),
      ),
    );
  }
}
