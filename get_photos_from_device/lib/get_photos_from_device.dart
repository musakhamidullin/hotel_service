
import 'get_photos_from_device_platform_interface.dart';

class GetPhotosFromDevice {
  Future<String?> getPlatformVersion() {
    return GetPhotosFromDevicePlatform.instance.getPlatformVersion();
  }
}
