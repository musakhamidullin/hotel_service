import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_photos_from_device/plugin.dart';

import '../../../data/models/image.dart';

import 'images_widget.dart';
import 'view/widget/get_photos_button.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({
    super.key,
    required this.onSavePressed,
    required this.images,
    required this.onDeletePressed,
    required this.onClearPressed,
  });

  final List<ImageModel> images;

  final void Function(List<ImageModel> items) onSavePressed;
  final void Function(String item) onDeletePressed;
  final VoidCallback onClearPressed;

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  final List<ImageModel> _images = [];

  Future<ImageModel> _onSelectedCameraPressed() async {
    final mediaService = MediaService();
    final dynamic targetPlatform = Platform.isAndroid
        ? AndroidPlatform(iMediaService: mediaService)
        : IOsPlatform(iMediaService: mediaService);
    final data =
        await GetPhotosFromDevicePlugin(iMobilePhotoManager: targetPlatform)
            .getPhoto();

    if (data.isEmpty) return ImageModel.empty();

    setState(() => _images.add(ImageModel.fromDevice(data)));

    return ImageModel.fromDevice(data);
  }

  @override
  void initState() {
    super.initState();

    _images.addAll(widget.images);
  }

  @override
  Widget build(BuildContext context) {
    final getPhotosButton = GetPhotosButton(
      onSelectedFromNativeGalleryPressed: (List<ImageModel> photos) =>
          setState(() {
        _images.addAll(photos);
      }),
      onSelectedFromImagePickerPressed: (List<ImageModel> photos) =>
          setState(() {
        _images.addAll(photos);
      }),
      onSelectedCameraPressed: (ImageModel photo) => setState(() {
        _images.add(photo);
      }),
      iconData: Icons.attach_file_rounded,
    );

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
                widget.onDeletePressed(_images[i].image);

                _images.removeAt(i);
              }),
              scrollController: scrollController,
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              leading: getPhotosButton,
              onTap: () {
                getPhotosButton.onTap(context);
              },
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
