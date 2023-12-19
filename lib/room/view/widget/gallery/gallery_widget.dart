import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'images_widget.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({
    super.key,
    required this.onSavePressed,
    required this.images,
    required this.onDeletePressed,
    required this.onClearPressed,
  });

  final List<String> images;

  final void Function(List<String> items) onSavePressed;
  final void Function(String item) onDeletePressed;
  final VoidCallback onClearPressed;

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  Future<void> _onSelectedFromGalleryPressed() async {
    final pickedImages = await ImagePicker().pickMultiImage();

    final bytes = pickedImages
        .map((e) => base64Encode(File(e.path).readAsBytesSync()))
        .toList();

    setState(() {
      _images.addAll(bytes);
    });
  }

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
  void initState() {
    super.initState();

    _images.addAll(widget.images);
  }

  final List<String> _images = [];

  @override
  Widget build(BuildContext context) {
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
            ImagesWidget(
              images: _images,
              onClearPressed: () => setState(() {
                widget.onClearPressed();
                _images.clear();
              }),
              onDeleteItemPressed: (i) => setState(() {
                widget.onDeletePressed(_images[i]);

                _images.removeAt(i);
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
            const Divider(
              endIndent: 16,
              indent: 16,
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              onTap: () async => await _onSelectedCameraPressed(),
              title: const Text('Сделать фото'),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
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
                          widget.onSavePressed(_images);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Сохранить'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
