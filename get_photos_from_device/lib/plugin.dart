import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

final class GetPhotosFromDevicePlugin {
  GetPhotosFromDevicePlugin() {
    _iGetService = MediaService();

    final dynamic targetPlatform = Platform.isAndroid
        ? AndroidPlatform(iMediaService: _iGetService)
        : IOsPlatform(iMediaService: _iGetService);

    _iMobilePhotoManager = targetPlatform;
  }

  late final IMobilePhotoManager _iMobilePhotoManager;
  late final IMediaService _iGetService;

  Future<List<String>> getPhotos() async =>
      await _iMobilePhotoManager.getPhotosFromGallery();

  Future<String> getPhoto() async =>
      await _iMobilePhotoManager.getPhotoFromCamera();

  Future<bool> checkPermission() async =>
      await _iMobilePhotoManager.checkPermission();

  Future<List<String>> getPhotosFromImagePicker() async =>
      await _iMobilePhotoManager.getPhotosFromImagesPicker();
}

sealed class BasePlatform implements IMobilePhotoManager {
  final MethodChannel channelGetPhoto = const MethodChannel('get_photo');
  final MethodChannel channelCheckPermission =
      const MethodChannel('get_permission');
}

abstract interface class IMediaService {
  Future<List<String>> getImagesFromGallery();

  Future<String> getImageFromCamera();
}

final class MediaService implements IMediaService {
  @override
  Future<List<String>> getImagesFromGallery() async {
    final files = await ImagePicker().pickMultiImage();

    final photos = files.map((e) => e.path).toList();

    if (photos.isEmpty) return <String>[];

    return photos;
  }

  @override
  Future<String> getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage == null) return '';

    return pickedImage.path;
  }
}

abstract interface class IMobilePhotoManager {
  Future<bool> checkPermission();

  Future<String> getPhotoFromCamera();

  Future<List<String>> getPhotosFromGallery();

  Future<List<String>> getPhotosFromImagesPicker();
}

final class AndroidPlatform extends BasePlatform
    implements IMobilePhotoManager {
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
      return false;
    }
  }

  @override
  Future<String> getPhotoFromCamera() async =>
      await _iMediaService.getImageFromCamera();

  @override
  Future<List<String>> getPhotosFromGallery() async {
    final isGranted = await checkPermission();

    if (!isGranted) await _iMediaService.getImagesFromGallery();

    List<String> photos = [];
    try {
      final List<dynamic> result =
          await channelGetPhoto.invokeMethod('getAllPhotos');
      for (final photo in result) {
        photos.add(photo as String);
      }

      return photos;
    } on PlatformException catch (e) {
      debugPrint("Failed to get permission: '${e.message}'.");
      return <String>[];
    }
  }

  @override
  Future<List<String>> getPhotosFromImagesPicker() async {
    final isGranted = await checkPermission();

    if (!isGranted) return await _iMediaService.getImagesFromGallery();

    return [];
  }
}

final class IOsPlatform extends BasePlatform implements IMobilePhotoManager {
  IOsPlatform({required IMediaService iMediaService})
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
      return false;
    }
  }

  @override
  Future<String> getPhotoFromCamera() async =>
      await _iMediaService.getImageFromCamera();

  @override
  Future<List<String>> getPhotosFromGallery() async {
    final isGranted = await checkPermission();

    if (isGranted) {
      List<String> photos = [];
      try {
        final List<dynamic> result =
            await channelGetPhoto.invokeMethod('getAllPhotos');
        for (final photo in result) {
          photos.add(photo as String);
        }
      } on PlatformException catch (e) {
        debugPrint("Failed to get all photos: '${e.message}'.");
      }
      return photos;
    }

    return await _iMediaService.getImagesFromGallery();
  }

  @override
  Future<List<String>> getPhotosFromImagesPicker() async {
    final isGranted = await checkPermission();

    if (!isGranted) return await _iMediaService.getImagesFromGallery();

    return [];
  }
}
