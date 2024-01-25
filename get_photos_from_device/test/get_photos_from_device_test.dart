import 'package:flutter_test/flutter_test.dart';
import 'package:get_photos_from_device/get_photos_from_device.dart';
import 'package:get_photos_from_device/get_photos_from_device_platform_interface.dart';
import 'package:get_photos_from_device/get_photos_from_device_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGetPhotosFromDevicePlatform
    with MockPlatformInterfaceMixin
    implements GetPhotosFromDevicePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GetPhotosFromDevicePlatform initialPlatform = GetPhotosFromDevicePlatform.instance;

  test('$MethodChannelGetPhotosFromDevice is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGetPhotosFromDevice>());
  });

  test('getPlatformVersion', () async {
    GetPhotosFromDevice getPhotosFromDevicePlugin = GetPhotosFromDevice();
    MockGetPhotosFromDevicePlatform fakePlatform = MockGetPhotosFromDevicePlatform();
    GetPhotosFromDevicePlatform.instance = fakePlatform;

    expect(await getPhotosFromDevicePlugin.getPlatformVersion(), '42');
  });
}
