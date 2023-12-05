import 'package:flutter/material.dart';

class IssueTextField extends StatefulWidget {
  const IssueTextField(
      {super.key,
      required this.text,
      required this.index,
      required this.onTextChanged,
      required this.onClearPressed});

  final String text;
  final int index;
  final void Function(String text) onTextChanged;
  final VoidCallback onClearPressed;

  @override
  State<IssueTextField> createState() => _IssueTextFieldState();
}

class _IssueTextFieldState extends State<IssueTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller.text = widget.text;
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller
        ..selection = TextSelection.fromPosition(
            TextPosition(offset: _controller.text.length)),
      onChanged: (text) => widget.onTextChanged,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: widget.onClearPressed, child: const Icon(Icons.close)),
          hintText: 'Комментарий...'),
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 5,
    );
  }
}
