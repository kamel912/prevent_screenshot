// ignore_for_file: unused_local_variable

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prevent_screenshot/prevent_screenshot_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelPreventScreenshot platform = MethodChannelPreventScreenshot();
  const MethodChannel channel = MethodChannel('prevent_screenshot');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('preventScreenCapture', () async {
    // expect(await platform.preventScreenCapture(), '42');
  });
}
