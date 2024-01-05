import 'package:flutter/material.dart';

import '../issue_field.dart';

class CommentsSheet extends StatefulWidget {
  const CommentsSheet({super.key});

  @override
  State<CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<CommentsSheet> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 1,
      minChildSize: 0.4,
      initialChildSize: 1,
      builder: (_, scrollController) => Padding(
        padding: const EdgeInsets.only(top: 12, left: 16, right: 12),
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
            const Flexible(
                child: Center(
              child: Text('Здесь будут комментарии'),
            )),
            Row(
              children: [
                Flexible(
                    child: IssueTextField(
                  readOnly: false,
                  onTextChanged: (String text) {},
                  onClearPressed: () {},
                  textEditingController: _textEditingController,
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.photo_camera_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.attach_file)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.mic))
              ],
            )
          ],
        ),
      ),
    );
  }
}
