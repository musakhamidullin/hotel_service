import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../common/widgets/cash_memory_image_provider.dart';
import '../../../../../../voice_messenger/view/record_button.dart';
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

  final ValueNotifier<bool> _canSend = ValueNotifier(false);

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
            _canSend.value = _messageValue.canSend();
          },
          onSubmitted: (value) {
            _messageValue = _messageValue.copyWith(text: value);
            context.read<CommentsCubit>().sendMessage(_messageValue);
            //todo clear after success send
            _textController.clear();
            _messageValue = _messageValue.copyWith(text: '');
            _canSend.value = _messageValue.canSend();
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
        if (_messageValue.buffImages?.isNotEmpty ?? false)
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _messageValue.buffImages!
                  .map(
                    (e) => // Image(
                        Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Image(
                        image: CacheMemoryImageProvider(
                          tag: _messageValue.buffImages!.indexOf(e).toString(),
                          img: e,
                        ),
                        fit: BoxFit.cover,
                        width: 90,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ValueListenableBuilder(
          valueListenable: _canSend,
          builder: (context, value, child) {
            return InputButtons(
              canSend: value,
              onPhotographed: (value) {
                setState(() {
                  _messageValue = _messageValue.copyWith(
                      buffImages: [...?_messageValue.buffImages, value]);
                });
                _canSend.value = _messageValue.canSend();
              },
              onSend: () {
                context.read<CommentsCubit>().sendMessage(_messageValue);
                //todo clear after success send
                _textController.clear();
                setState(() {
                  _messageValue = const MessageValue();
                });
                _canSend.value = _messageValue.canSend();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onClear: () {
                _textController.clear();
                setState(() {
                  _messageValue = const MessageValue();
                });
                _canSend.value = _messageValue.canSend();
                FocusManager.instance.primaryFocus?.unfocus();
              },
            );
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
    required this.onClear,
    required this.onPhotographed,
    required this.canSend,
  });

  final Function() onSend;
  final Function() onClear;
  final Function(Uint8List) onPhotographed;
  final bool canSend;

  @override
  State<InputButtons> createState() => _InputButtonsState();
}

class _InputButtonsState extends State<InputButtons> {
  Future<void> _onSelectedCameraPressed() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage?.path == null) return;
    widget.onPhotographed(File(pickedImage!.path).readAsBytesSync());
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
        RecordButton(
          onRecord: (value) {},
          onStop: (value) {},
        ),
        IconButton(
          onPressed: widget.canSend ? widget.onSend : null,
          icon: const Icon(Icons.send),
        ),
        IconButton(
          onPressed: widget.canSend ? widget.onClear : null,
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }
}
