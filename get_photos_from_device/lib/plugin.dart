import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

final class GetPhotosFromDevicePlugin {
  GetPhotosFromDevicePlugin({required IMobilePhotoManager iMobilePhotoManager})
      : _iMobilePhotoManager = iMobilePhotoManager;

  final IMobilePhotoManager _iMobilePhotoManager;

  Future<(List<String>, bool)> getPhotos() async {
    final isCheck = await _iMobilePhotoManager.checkPermission();

    if (isCheck) return await _iMobilePhotoManager.getPhotosFromGallery();

    return (<String>[], false);
  }

  Future<(String, bool)> getPhoto() async {
    final isCheck = await _iMobilePhotoManager.checkPermission();

    if (isCheck) return await _iMobilePhotoManager.getPhotoFromCamera();

    return ('', false);
  }
}

sealed class AppEnv {
  final MethodChannel channelGetPhoto = const MethodChannel('get_photo');
  final MethodChannel channelCheckPermission =
      const MethodChannel('get_permission');
}

abstract interface class IMediaService {
  Future<(List<String>, bool)> getImagesFromGallery();
  Future<(String, bool)> getImageFromCamera();
}

final class MediaService implements IMediaService {
  @override
  Future<(List<String>, bool)> getImagesFromGallery() async {
    final files = await ImagePicker().pickMultiImage();

    final photos = files.map((e) => e.path).toList();

    if (photos.isEmpty) return (<String>[], false);

    return (photos, true);
  }

  @override
  Future<(String, bool)> getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage == null) return ('', false);

    return (pickedImage.path, true);
  }
}

abstract interface class IMobilePhotoManager {
  Future<bool> checkPermission();

  Future<(String, bool)> getPhotoFromCamera();

  Future<(List<String>, bool)> getPhotosFromGallery();
}

final class AndroidPlatform extends AppEnv implements IMobilePhotoManager {
  AndroidPlatform({required IMediaService iMediaService})
      : _iMediaService = iMediaService;

  final IMediaService _iMediaService;

  @override
  Future<bool> checkPermission() async {
    try {
      final result =
          await channelCheckPermission.invokeMethod('checkReadMedia') as bool;
      return result;
    } on PlatformException catch (e) {
      debugPrint("Failed to get permission: '${e.message}'.");
    }
    return false;
  }

  @override
  Future<(String, bool)> getPhotoFromCamera() async =>
      await _iMediaService.getImageFromCamera();

  @override
  Future<(List<String>, bool)> getPhotosFromGallery() async {
    List<String> photos = [];
    try {
      final List<dynamic> result =
          await channelGetPhoto.invokeMethod('getAllPhotos');
      for (final photo in result) {
        photos.add(photo as String);
      }

      return (photos, true);
    } on PlatformException catch (e) {
      debugPrint("Failed to get permission: '${e.message}'.");
      return (<String>[], false);
    }
  }
}

final class IOsPlatform extends AppEnv implements IMobilePhotoManager {
  IOsPlatform({required IMediaService iMediaService})
      : _iMediaService = iMediaService;

  final IMediaService _iMediaService;

  @override
  Future<bool> checkPermission() {
    // TODO: implement checkPermission
    throw UnimplementedError();
  }

  @override
  Future<(String, bool)> getPhotoFromCamera() async =>
      await _iMediaService.getImageFromCamera();

  @override
  Future<(List<String>, bool)> getPhotosFromGallery() async {
    final (data, isGranted) = await _iMediaService.getImagesFromGallery();

    if (!isGranted) {
      List<String> photos = [];
      try {
        final List<dynamic> result =
            await channelGetPhoto.invokeMethod('getAllPhotos');
        for (final photo in result) {
          photos.add(photo as String);
        }

        return (photos, true);
      } on PlatformException catch (e) {
        debugPrint("Failed to get permission: '${e.message}'.");
        return (<String>[], false);
      }
    }
    return (data, isGranted);
  }
}
