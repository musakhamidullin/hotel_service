import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    final isGranted = await _isCheckPermission();

    if (isGranted) {
      return (await _getAllPhotos(), isGranted);
    }

    return (<String>[], isGranted);
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
}
