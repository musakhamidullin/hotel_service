import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/room_cubit.dart';
import '../../../../data/models/issues.dart';
import '../cubit/comments_cubit.dart';
import 'widget/input_card.dart';
import 'widget/message_card.dart';

class CommentsSheet extends StatefulWidget {
  const CommentsSheet({
    super.key,
    required this.issue,
    required this.index,
    required this.cubit,
  });

  final IssuesModel issue;
  final int index;
  final RoomCubit cubit;

  @override
  State<CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<CommentsSheet> {
  final TextEditingController _textEditingController = TextEditingController();
  final _commentsCubit = CommentsCubit();

  @override
  void dispose() {
    _textEditingController.dispose();
    _commentsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 1.0,
      maxChildSize: 1.0,
      minChildSize: .4,
      builder: (_, controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: BlocProvider(
            create: (context) => _commentsCubit,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Комментарии',
                        style: theme.textTheme.titleLarge,
                      ),
                      FilledButton.tonal(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Закрыть'),
                      )
                    ],
                  ),
                  Expanded(
                    child: BlocConsumer<CommentsCubit, CommentsState>(
                      listenWhen: (prev, curr) =>
                          prev.messages.length != curr.messages.length,
                      listener: (context, state) {
                        controller.jumpTo(controller.position.maxScrollExtent);
                      },
                      builder: (context, state) {
                        return ListView.builder(
                          controller: controller,
                          reverse: false,
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) =>
                              MessageCard(messageValue: state.messages[index]),
                        );
                      },
                    ),
                  ),
                  const InputCard()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
