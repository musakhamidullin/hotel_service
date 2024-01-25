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
    final (data, isGrant) = await GetPhotosFromDevicePlugin.getPhotos();

    if (!isGrant) return noPermission();

    return data.map((e) => ImageModel.fromDevice(e)).toList();
  }

  Future<ImageModel> _onSelectedCameraPressed() async {
    final (data, isGrant) = await GetPhotosFromDevicePlugin.getPhoto();

    if (!isGrant) return noPermission();

    return ImageModel.fromDevice(data);
  }

  Never noPermission() => throw StateError('Empty photo from camera');

  void onTap(BuildContext context) async {
    Modals.showBottomSheet(
        context,
        NativePhotoParserWidget(
          callImagePicker: () async {
            final photos = await _onSelectedFromGalleryPressed();
            onSelectedFromImagePickerPressed(photos);
          },
          callCamera: () async {
            final photo = await _onSelectedCameraPressed();
            onSelectedCameraPressed(photo);
          },
          onAddPhotosPressed: (List<String> images) {
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
