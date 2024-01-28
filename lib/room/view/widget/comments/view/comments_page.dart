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
    )..fetchFirstPage();

    _scrollController.addListener(_listenScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listenScroll);
    _scrollController.dispose();
    _textEditingController.dispose();
    _commentsCubit.close();
    super.dispose();
  }

  Future<void> _listenScroll() async {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      await _commentsCubit.fetchNewPage();
    } else if (_scrollController.position.pixels <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      await _commentsCubit.fetchFirstPage();
    }
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
          body: BlocConsumer<CommentsCubit, CommentsState>(
            listener: (context, state) {
              if (state.messages.isNotEmpty && state.failure()) {
                Modals.showInformationDialog(
                  context,
                  'Ошибка',
                  Icons.warning_amber_rounded,
                );
              } else if (state.success()) {
                // Future(() {
                //   _scrollController
                //       .jumpTo(_scrollController.position.minScrollExtent);
                // });
              }
            },
            builder: (context, state) {
              if (state.loading() && state.messages.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.failure() && state.messages.isEmpty) {
                return FailureWidget(
                  onPressed: () async {
                    await _commentsCubit.fetchFirstPage();
                  },
                );
              }
              return Stack(
                children: [
                  ListView.builder(
                    controller: _scrollController,
                    reverse: true,
                    padding: const EdgeInsets.fromLTRB(12, 46, 12, 12),
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final card = MessageCard(
                        key: ObjectKey(state.messages[index]),
                        messageValue: state.messages[index],
                      );
                      if (state.paging() &&
                          index == (state.messages.length - 1)) {
                        return Column(
                          children: [
                            const SizedBox.square(
                              dimension: 34,
                              child: CircularProgressIndicator(),
                            ),
                            card,
                          ],
                        );
                      }
                      return card;
                    },
                  ),
                  if (state.loading() && state.messages.isNotEmpty)
                    const Center(child: CircularProgressIndicator()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
