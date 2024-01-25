import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_photos_from_device/get_photos_from_device_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelGetPhotosFromDevice platform = MethodChannelGetPhotosFromDevice();
  const MethodChannel channel = MethodChannel('get_photos_from_device');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
