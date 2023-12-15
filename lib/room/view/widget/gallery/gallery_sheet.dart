import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../cubit/room_cubit.dart';
import '../../room_page.dart';
import 'gridview_images.dart';

class GalleryBottomSheet extends StatelessWidget {
  const GalleryBottomSheet({
    super.key,
    required this.indexIssue,
    this.isCreatedTab = false,
    required this.roomCubit,
    required this.scrollController,
  });

  final int indexIssue;
  final bool isCreatedTab;
  final RoomCubit roomCubit;
  final ScrollController scrollController;

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
      bloc: roomCubit,
      builder: (context, state) {
        final images = isCreatedTab
            ? state.createdIssues[indexIssue].images
            : state.addedIssues[indexIssue].images;

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (images.isNotEmpty)
              GridViewIssueImages(
                index: indexIssue,
                images: images,
                onFlushPressed: () => roomCubit.onFlushPressed(indexIssue),
                onDeleteImagePressed: (photoIndex) {
                  roomCubit.onDeleteImagePressed(
                      indexIssue, images[photoIndex]);
                },
                roomCubit: roomCubit,
                scrollController: scrollController,
              ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              leading: const Icon(Icons.add_photo_alternate_outlined),
              onTap: () async =>
                  await _onSelectedFromGalleryPressed(indexIssue, roomCubit),
              title: const Text('Выбрать из галереи'),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              onTap: () async {
                await _onSelectedCameraPressed(indexIssue, roomCubit);
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
                      child: FilledButton.tonal(
                        onPressed: Navigator.of(context).pop,
                        child: const Text('Сохранить'),
                      ),
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
