import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../auth/data/repositories/auth_rep.dart';
import '../../../../../common/widgets/failure_widget.dart';
import '../../../../../common/widgets/modals.dart';
import '../../../../../voice_messenger/cubit/voice_manager_cubit.dart';
import '../cubit/comments_cubit.dart';
import '../data/models/report_update.dart';
import '../data/repositories/comment_repo.dart';
import 'widget/input_card.dart';
import 'widget/message_card.dart';

@RoutePage()
class CommentsPage extends StatefulWidget {
  const CommentsPage({
    super.key,
    required this.reportCleaningProblemUpdate,
    required this.voiceManagerCubit,
  });

  final ReportCleaningProblemUpdate reportCleaningProblemUpdate;
  final VoiceManagerCubit voiceManagerCubit;

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final TextEditingController _textEditingController = TextEditingController();
  late final CommentsCubit _commentsCubit;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _commentsCubit = CommentsCubit(
      commentRepo: CommentRepo(),
      reportCleaningProblemUpdate: widget.reportCleaningProblemUpdate,
      user: context.read<AuthRep>().user,
    )
      ..fetchMessages(firstPage: true);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    _commentsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _commentsCubit,
        ),
      ],
      child: BlocProvider.value(
        value: widget.voiceManagerCubit,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text('Комментарии'),
          ),
          bottomNavigationBar: const InputCard(),
          body: NotificationListener<ScrollNotification>(
            onNotification: (value) {
              if (value.metrics.pixels >= value.metrics.maxScrollExtent &&
                  !value.metrics.outOfRange) {
                //todo fetch new page
                // _commentsCubit.fetchMessages();
              }
              return true;
            },
            child: BlocConsumer<CommentsCubit, CommentsState>(
              listenWhen: (prev, curr) =>
              prev.messages.length != curr.messages.length,
              listener: (context, state) {
                if (state.messages.isNotEmpty && state.failure()) {
                  Modals.showInformationDialog(context, 'Заявка не отправлена',
                      Icons.warning_amber_rounded);
                } else if (state.success()) {
                  Future(() {
                    _scrollController
                        .jumpTo(_scrollController.position.minScrollExtent);
                  });
                }
              },
              builder: (context, state) {
                if (state.loading() && state.messages.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.failure() && state.messages.isEmpty) {
                  return FailureWidget(
                    onPressed: () async {
                      await _commentsCubit.fetchMessages(firstPage: true);
                    },
                  );
                }
                return Stack(
                  children: [
                    ListView.builder(
                      controller: _scrollController,
                      reverse: true,
                      padding: const EdgeInsets.all(12.0),
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) =>
                          MessageCard(messageValue: state.messages[index]),
                    ),
                    if (state.loading() && state.messages.isNotEmpty)
                      const Center(child: CircularProgressIndicator()),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
