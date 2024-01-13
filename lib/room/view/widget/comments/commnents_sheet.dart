import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/widgets/modals.dart';
import '../../../cubit/room_cubit.dart';
import '../../../data/models/issues.dart';
import '../gallery/gallery_widget.dart';
import '../issue_field.dart';
import 'comment_gallery.dart';

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
                    onPressed: () async => await _onSelectedCameraPressed(),
                    icon: const Icon(Icons.photo_camera_outlined)),
                IconButton(
                    onPressed: () {
                      final cubit = widget.cubit;
                      final images = cubit
                              .state
                              .issues[cubit.state.tabIndex]?[widget.index]
                              .images ??
                          [];

                      Modals.showBottomSheet(
                        context,
                        const CommentGallery()
                        // GalleryWidget(
                        //     onSavePressed: (List<String> items) =>
                        //         cubit.onIssueModelChanged(
                        //             widget.issue.copyWith(images: items)),
                        //     images: images,
                        //     onDeletePressed: (String item) =>
                        //         cubit.onIssueModelChanged(
                        //           widget.issue.copyWith(
                        //               images: [...widget.issue.images]
                        //                 ..removeWhere((e) => e == item)),
                        //         ),
                        //     onClearPressed: () => cubit.onIssueModelChanged(
                        //         widget.issue.copyWith(images: []))),
                      );
                    },
                    icon: const Icon(Icons.attach_file)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.mic))
              ],
            )
          ],
        ),
      ),
    );
  }
}
