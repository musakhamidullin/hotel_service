import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'images_widget.dart';

class GallaryWidget extends StatefulWidget {
  const GallaryWidget({
    super.key,
    required this.onSavePressed,
  });

  final void Function(List<String> items) onSavePressed;

  @override
  State<GallaryWidget> createState() => _GallaryWidgetState();
}

class _GallaryWidgetState extends State<GallaryWidget> {
  Future<void> _onSelectedFromGalleryPressed() async {
    final pickedImages = await ImagePicker().pickMultiImage();

    final bytes = pickedImages
        .map((e) => base64UrlEncode(File(e.path).readAsBytesSync()))
        .toList();

    setState(() {
      images.addAll(bytes);
    });
  }

  Future<void> _onSelectedCameraPressed() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        images.add(base64UrlEncode(File(pickedImage.path).readAsBytesSync()));
      });
    }
  }

  final List<String> images = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 1,
      minChildSize: 0.4,
      initialChildSize: 1,
      builder: (context, scrollController) {
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
              ImagesWidget(
                images: images,
                onClearPressed: () => setState(() {
                  images.clear();
                }),
                onDeleteItemPressed: (i) => setState(() {
                  images.removeAt(i);
                }),
                scrollController: scrollController,
              ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              leading: const Icon(Icons.add_photo_alternate_outlined),
              onTap: () async => await _onSelectedFromGalleryPressed(),
              title: const Text('Выбрать из галереи'),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              onTap: () async => await _onSelectedCameraPressed(),
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
                        onPressed: () {
                          widget.onSavePressed(images);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Сохранить'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8)
          ],
        );
      },
    );
  }
}
