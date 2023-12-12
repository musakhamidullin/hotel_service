import 'package:flutter/material.dart';

class IssueTextField extends StatelessWidget {
  const IssueTextField({
    super.key,
    required this.index,
    required this.onTextChanged,
    required this.onClearPressed,
    required this.textEditingController,
  });

  final int index;
  final void Function(String text) onTextChanged;
  final VoidCallback onClearPressed;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: onTextChanged,
      decoration: const InputDecoration(hintText: 'Комментарий...'),
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 5,
    );
  }
}
