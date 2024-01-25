import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

final class GetPhotosFromDevicePlugin {
  static const MethodChannel _channelGetPhoto = MethodChannel('get_photo');
  static const MethodChannel _channelCheckPermission =
      MethodChannel('get_permission');

  static Future<bool> _isCheckPermission() async {
    try {
      final result =
          await _channelCheckPermission.invokeMethod('checkReadMedia') as bool;
      return result;
    } on PlatformException catch (e) {
      debugPrint("Failed to get permission: '${e.message}'.");
    }
    return false;
  }

  static Future<(List<String>, bool)> getPhotos() async {
    if (Platform.isAndroid) {
      final isGranted = await _isCheckPermission();

      if (isGranted) {
        return (await _getAllPhotos(), isGranted);
      }

      final files = await _onSelectedFromGalleryPressed();

      if (files.isNotEmpty) {
        final photos = files.map((e) => e.path).toList();

        return (photos, true);
      }

      return (<String>[], isGranted);
    }

    if (Platform.isIOS) {
      return throw '''In development''';
    }
    return (<String>[], false);
  }

  static Future<(String, bool)> getPhoto() async {
    try {
      if (Platform.isAndroid) {
        final photo = await _onSelectedCameraPressed();
        return (photo.path, true);
      }
      if (Platform.isIOS) {}

      return ('', false);
    } catch (e) {
      debugPrint(e.toString());
      return ('', false);
    }
  }

  static Future<List<String>> _getAllPhotos() async {
    List<String> photos = [];
    try {
      final List<dynamic> result =
          await _channelGetPhoto.invokeMethod('getAllPhotos');
      for (final photo in result) {
        photos.add(photo as String);
      }
    } on PlatformException catch (e) {
      debugPrint("Failed to get permission: '${e.message}'.");
    }
    return photos;
  }

  static Future<List<XFile>> _onSelectedFromGalleryPressed() async {
    final photos = await ImagePicker().pickMultiImage();

    if (photos.isEmpty) throw '''Couldn't select photos''';

    return photos;
  }

  static Future<XFile> _onSelectedCameraPressed() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) return pickedImage;

    return throw '''Couldn't take a picture''';
  }
}
