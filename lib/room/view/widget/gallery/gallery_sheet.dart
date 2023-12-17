import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../cubit/room_cubit.dart';
import '../../room_page.dart';
import 'gridview_images.dart';

class GalleryBottomSheet extends StatefulWidget {
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

  @override
  State<GalleryBottomSheet> createState() => _GalleryBottomSheetState();
}

class _GalleryBottomSheetState extends State<GalleryBottomSheet> {
  Future<void> _onSelectedFromGalleryPressed(int i, RoomCubit roomCubit) async {
    final images = await ImagePicker().pickMultiImage();
    roomCubit.onAddTempImagesPressed(images);
  }

  Future<void> _onSelectedCameraPressed(int i, RoomCubit roomCubit) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      roomCubit.onAddTempImagesPressed([image]);
    }
  }

  @override
  void dispose() {
    widget.roomCubit.onClearTempImagesPressed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RoomBuilder(
      bloc: widget.roomCubit,
      builder: (context, state) {
        final images = state.tempImages;

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (images.isEmpty)
              Flexible(
                child: Center(
                  child: Opacity(
                    opacity: 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.photo_library_outlined,
                          size: 128,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Добавьте фотографии',
                          style: theme.textTheme.titleLarge,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            if (images.isNotEmpty)
              GridViewIssueImages(
                index: widget.indexIssue,
                images: images,
                onFlushPressed: () =>
                    widget.roomCubit.onClearTempImagesPressed(),
                onDeleteImagePressed: (photoIndex) {
                  widget.roomCubit.onDeleteTempImagePressed(images[photoIndex]);
                },
                roomCubit: widget.roomCubit,
                scrollController: widget.scrollController,
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
                          onPressed: () {
                            widget.roomCubit.onClearTempImagesPressed();
                            Navigator.pop(context);
                          },
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
                        onPressed: () {
                          widget.roomCubit
                              .onSaveImagesPressed(widget.indexIssue);
                          Navigator.of(context).pop();
                        },
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
