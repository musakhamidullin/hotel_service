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

  Future<List<ImageModel>> _onSelectedFromGalleryPressed() async {
    final mediaService = MediaService();
    final dynamic targetPlatform = Platform.isAndroid
        ? AndroidPlatform(iMediaService: mediaService)
        : IOsPlatform(iMediaService: mediaService);
    final data =
        await GetPhotosFromDevicePlugin(iMobilePhotoManager: targetPlatform)
            .getPhotos();

    if (data.isEmpty) return [];

    return data.map((e) => ImageModel.fromDevice(e)).toList();
  }

  Future<ImageModel> _onSelectedCameraPressed() async {
    final mediaService = MediaService();
    final dynamic targetPlatform = Platform.isAndroid
        ? AndroidPlatform(iMediaService: mediaService)
        : IOsPlatform(iMediaService: mediaService);
    final data =
        await GetPhotosFromDevicePlugin(iMobilePhotoManager: targetPlatform)
            .getPhoto();

    if (data.isEmpty) return ImageModel.empty();

    return ImageModel.fromDevice(data);
  }

  void onTap(BuildContext context) async {
    Modals.showBottomSheet(
        context,
        NativePhotoParserWidget(
          callImagePicker: () async {
            final photos = await _onSelectedFromGalleryPressed();

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
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => onTap(context), child: Icon(iconData));
  }
}
