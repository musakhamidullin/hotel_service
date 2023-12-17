import 'package:flutter/material.dart';

class IssueTextField extends StatelessWidget {
  const IssueTextField({
    super.key,
    required this.readOnly,
    required this.index,
    required this.onTextChanged,
    required this.onClearPressed,
    required this.textEditingController,
  });

  final bool readOnly;
  final int index;
  final void Function(String text) onTextChanged;
  final VoidCallback onClearPressed;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      enabled: !readOnly,
      controller: textEditingController,
      onChanged: onTextChanged,
      decoration: const InputDecoration(hintText: 'Комментарий...'),
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 5,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
