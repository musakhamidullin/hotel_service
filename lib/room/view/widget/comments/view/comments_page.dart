import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/widgets/failure_widget.dart';
import '../../../../../voice_messenger/cubit/voice_manager_cubit.dart';
import '../../../../data/models/issues.dart';
import '../cubit/comments_cubit.dart';
import '../data/models/report_update.dart';
import '../repositories/comment_repo.dart';
import 'widget/input_card.dart';
import 'widget/message_card.dart';

@RoutePage()
class CommentsPage extends StatefulWidget {
  const CommentsPage({
    super.key,
    required this.issue,
    required this.index,
    required this.reportCleaningProblemUpdate,
  });

  final IssuesModel issue;
  final int index;
  final ReportCleaningProblemUpdate reportCleaningProblemUpdate;

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final _voiceManagerCubit = VoiceManagerCubit();
  late final CommentsCubit _commentsCubit;

  @override
  void initState() {
    super.initState();
    _commentsCubit = CommentsCubit(
      commentRepo: CommentRepo(),
      reportCleaningProblemUpdate: widget.reportCleaningProblemUpdate,
    )..fetchMessages();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _commentsCubit.close();
    _voiceManagerCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _commentsCubit,
        ),
        BlocProvider(
          create: (context) => _voiceManagerCubit,
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text('Комментарии'),),
        bottomNavigationBar: const InputCard(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocConsumer<CommentsCubit, CommentsState>(
            listenWhen: (prev, curr) =>
            prev.messages.length != curr.messages.length,
            listener: (context, state) {
            },
            builder: (context, state) {
              if (state.loading() && state.messages.isEmpty) {
                return const Center(
                    child: CircularProgressIndicator());
              }
              if (state.failure()) {
                return FailureWidget(
                  onPressed: () {},
                );
              }
              return ListView.builder(
                reverse: false,
                itemCount: state.messages.length,
                itemBuilder: (context, index) =>
                    MessageCard(messageValue: state.messages[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
