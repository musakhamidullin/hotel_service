import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_photos_from_device/plugin.dart';

import '../../../../../../common/widgets/modals.dart';
import '../../../../../data/models/image.dart';
import '../../gallery_native.dart';

class GetPhotosButton extends StatelessWidget {
  const GetPhotosButton({
    super.key,
    required this.onSelectedFromNativeGalleryPressed,
    required this.onSelectedFromImagePickerPressed,
    required this.onSelectedCameraPressed,
    required this.iconData,
  });

  final void Function(List<ImageModel>) onSelectedFromNativeGalleryPressed;
  final void Function(List<ImageModel>) onSelectedFromImagePickerPressed;
  final void Function(ImageModel) onSelectedCameraPressed;
  final IconData iconData;

  Future<ImageModel> _onSelectedCameraPressed() async {
    final photo = await GetPhotosFromDevicePlugin().getPhoto();

    if (photo.isEmpty) return ImageModel.empty();

    return ImageModel.fromDevice(photo);
  }

  Future<bool> _checkPermission() async =>
      await GetPhotosFromDevicePlugin().checkPermission();

  Future<List<ImageModel>> _onSelectedFromImagePickerPhotos() async {
    final photos = await GetPhotosFromDevicePlugin().getPhotosFromImagePicker();

    return photos.map((e) => ImageModel.fromDevice(e)).toList();
  }

  void onTap(BuildContext context) async {
    final isGrant = await _checkPermission();

    // если разрешение не предоставлено, открываем ImagePicker
    if (!isGrant && Platform.isAndroid) {
      final photos = await _onSelectedFromImagePickerPhotos();
      onSelectedFromNativeGalleryPressed(photos);
      return;
    }

    // если разрешение предоставлено, виджет NativePhotoParserWidget
    // вызывает GetPhotosFromDevicePlugin

    if (isGrant) {
      await Future.sync(
        () => Modals.showBottomSheet(
            barrierColor: Colors.black,
            context,
            NativePhotoParserWidget(
              callImagePicker: () async {
                final photos = await _onSelectedFromImagePickerPhotos();

                if (photos.isEmpty) return;

                onSelectedFromImagePickerPressed(photos);
              },
              callCamera: () async {
                final photo = await _onSelectedCameraPressed();

                if (ImageModel.isEmpty(photo)) return;

                onSelectedCameraPressed(photo);
              },
              onAddPhotosPressed: (List<String> images) {
                if (images.isEmpty) return;

                final photos = ImageModel.getImageModels(images);
                onSelectedFromNativeGalleryPressed(photos);
              },
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => onTap(context), child: Icon(iconData));
  }
}
