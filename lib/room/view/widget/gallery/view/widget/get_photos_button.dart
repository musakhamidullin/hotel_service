import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
    final pickedImages = await ImagePicker().pickMultiImage();

    return pickedImages
        .map((e) =>
            ImageModel.fromDevice(base64Encode(File(e.path).readAsBytesSync())))
        .toList();
  }

  Future<ImageModel> _onSelectedCameraPressed() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      return ImageModel.fromDevice(pickedImage.path);
    }
    return empty();
  }

  Never empty() => throw StateError('Empty photo from camera');

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
