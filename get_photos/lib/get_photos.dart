import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class GetPhotos {
  static const MethodChannel _channel = MethodChannel('get_photo');
  static const MethodChannel _channelCheckPermission =
      MethodChannel('get_permission');

  static Future<bool> isCheckPermission() async {
    try {
      return await _channelCheckPermission.invokeMethod('checkReadMedia') as bool;
    } on PlatformException catch (e) {
      print("Failed to get permission: '${e.message}'.");
    }
    return false;
  }

  static Future<(List<String>, bool)> getAllPhotos() async {
    List<String> photos = [];
    try {
      final List<dynamic> result = await _channel.invokeMethod('getAllPhotos');
      for (final photo in result) {
        photos.add(photo as String);
      }
    } on PlatformException catch (_) {
      return (await _onSelectedFromGalleryPressed(), true);
    }
    return (photos, false);
  }

  static Future<List<String>> _onSelectedFromGalleryPressed() async {
    final pickedImages = await ImagePicker().pickMultiImage();

    return pickedImages
        .map((e) => base64Encode(File(e.path).readAsBytesSync()))
        .toList();
  }
}
