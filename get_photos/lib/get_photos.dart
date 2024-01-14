import 'package:flutter/services.dart';

class GetPhotos {
  static const MethodChannel _channel = MethodChannel('get_photo');

  static Future<List<String>> getAllPhotos() async {
    List<String> photos = [];
    try {
      final List<dynamic> result = await _channel.invokeMethod('getAllPhotos');
      for (final photo in result) {
        photos.add(photo as String);
      }
    } on PlatformException catch (e) {
      print("Failed to get all photos: '${e.message}'.");
    }
    return photos;
  }
}
