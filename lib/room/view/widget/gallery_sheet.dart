import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../cubit/room_cubit.dart';
import '../room_page.dart';
import 'gridview_images.dart';

class GalleryBottomSheet extends StatefulWidget {
  const GalleryBottomSheet({
    super.key,
    required this.indexIssue,
    this.isCreatedTab = false,
    required this.roomCubit,
  });

  final int indexIssue;
  final bool isCreatedTab;
  final RoomCubit roomCubit;

  @override
  State<GalleryBottomSheet> createState() => _GalleryBottomSheetState();
}

class _GalleryBottomSheetState extends State<GalleryBottomSheet> {
  Future<void> _onSelectedFromGalleryPressed(int i, RoomCubit roomCubit) async {
    final images = await ImagePicker().pickMultiImage();

    roomCubit.onAddImagesFromGalleryPressed(i, images);
  }

  Future<void> _onSelectedCameraPressed(int i, RoomCubit roomCubit) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    roomCubit.onAddImageFromCameraPressed(i, image);
  }

  @override
  Widget build(BuildContext context) {
    return RoomBuilder(
      bloc: widget.roomCubit,
      builder: (context, state) {
        final images = widget.isCreatedTab
            ? state.createdIssues[widget.indexIssue].images
            : state.addedIssues[widget.indexIssue].images;

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (images.isNotEmpty)
              GridViewIssueImages(
                index: widget.indexIssue,
                images: images,
                onFlushPressed: () =>
                    widget.roomCubit.onFlushPressed(widget.indexIssue),
                onDeleteImagePressed: (photoIndex) {
                  widget.roomCubit.onDeleteImagePressed(
                      widget.indexIssue, images[photoIndex]);
                },
                roomCubit: widget.roomCubit,
              ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              leading: const Icon(Icons.add_photo_alternate_outlined),
              onTap: () async => await _onSelectedFromGalleryPressed(
                  widget.indexIssue, widget.roomCubit),
              title: const Text('Выбрать из галереи'),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              onTap: () async {
                await _onSelectedCameraPressed(
                    widget.indexIssue, widget.roomCubit);
              },
              title: const Text('Сделать фото'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Отменить')),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Ок')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            )
          ],
        );
      },
    );
  }
}
