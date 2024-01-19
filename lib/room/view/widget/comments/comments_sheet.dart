import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../../../cubit/room_cubit.dart';
import '../../../data/models/issues.dart';
import '../issue_field.dart';

class CommentsSheet extends StatefulWidget {
  const CommentsSheet(
      {super.key,
      required this.issue,
      required this.index,
      required this.cubit});

  final IssuesModel issue;
  final int index;
  final RoomCubit cubit;

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

  final List<String> _images = [];

  Future<void> _onSelectedCameraPressed() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _images.add(base64Encode(File(pickedImage.path).readAsBytesSync()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
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
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: 100,
                itemBuilder: (context, i) => Text(i.toString()),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: IssueTextField(
                  readOnly: false,
                  onTextChanged: (String text) {},
                  onClearPressed: () {},
                  textEditingController: _textEditingController,
                )),
                IconButton(
                    onPressed: () async => await _onSelectedCameraPressed(),
                    icon: const Icon(Icons.photo_camera_outlined)),
                IconButton(
                    onPressed: () async {
                      // final result = await GetPhotos.isCheckPermission();
                      // await Future.sync(() => ScaffoldMessenger.of(context)
                      //     .showSnackBar(SnackBar(
                      //         content: Text('Permission is: $result'))));

                      // Modals.showBottomSheet(context, const CommentGallery());
                    },
                    icon: const Icon(Icons.attach_file)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.mic))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
