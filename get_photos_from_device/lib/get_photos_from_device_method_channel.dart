import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'get_photos_from_device_platform_interface.dart';

/// An implementation of [GetPhotosFromDevicePlatform] that uses method channels.
class MethodChannelGetPhotosFromDevice extends GetPhotosFromDevicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('get_photos_from_device');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
