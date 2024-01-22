
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../cubit/comments_cubit.dart';
import '../../data/models/message_value.dart';

class InputCard extends StatefulWidget {
  const InputCard({super.key});

  @override
  State<InputCard> createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  final _textController = TextEditingController();
  var _messageValue = const MessageValue();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _textController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
            filled: true,
          ),
          onChanged: (value) {
            _messageValue = _messageValue.copyWith(text: value);
          },
          onSubmitted: (value) {
            _messageValue = _messageValue.copyWith(text: value);
            context.read<CommentsCubit>().sendMessage(_messageValue);
            FocusManager.instance.primaryFocus?.unfocus();
            //todo clear after success send
            _textController.clear();
          },
        ),
        InputButtons(
          textEditingController: _textController,
          onSend: () {
            context.read<CommentsCubit>().sendMessage(_messageValue);
            FocusManager.instance.primaryFocus?.unfocus();
            //todo clear after success send
            _textController.clear();
          },
        )
      ],
    );
  }
}

class InputButtons extends StatefulWidget {
  const InputButtons({
    super.key,
    required this.onSend,
    required this.textEditingController,
  });

  final Function() onSend;
  final TextEditingController textEditingController;

  @override
  State<InputButtons> createState() => _InputButtonsState();
}

class _InputButtonsState extends State<InputButtons> {
  final List<String> _images = [];
  var _hasText = false;

  Future<void> _onSelectedCameraPressed() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _images.add(pickedImage.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(_textListener);
  }

  @override
  void dispose() {
    widget.textEditingController.removeListener(_textListener);
    super.dispose();
  }

  void _textListener() {
    setState(() {
      _hasText = widget.textEditingController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () async => await _onSelectedCameraPressed(),
          icon: const Icon(Icons.photo_camera_outlined),
        ),
        IconButton(
            onPressed: () async {
              // final result = await GetPhotos.isCheckPermission();
              // await Future.sync(() => ScaffoldMessenger.of(context)
              //     .showSnackBar(SnackBar(
              //         content: Text('Permission is: $result'))));

              // Modals.showBottomSheet(context, const CommentGallery());
            },
            icon: const Icon(Icons.attach_file)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.mic),
        ),
        IconButton(
          onPressed: _hasText ? widget.onSend : null,
          icon: const Icon(Icons.send),
        ),
        IconButton(
          onPressed: _hasText
              ? () {
                  //todo clear all images
                  widget.textEditingController.clear();
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              : null,
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }
}
