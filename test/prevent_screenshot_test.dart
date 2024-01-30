import 'package:flutter_test/flutter_test.dart';
import 'package:prevent_screenshot/prevent_screenshot.dart';
import 'package:prevent_screenshot/prevent_screenshot_platform_interface.dart';
import 'package:prevent_screenshot/prevent_screenshot_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPreventScreenshotPlatform
    with MockPlatformInterfaceMixin
    implements PreventScreenshotPlatform {
  @override
  Future<void> preventScreenCapture({required bool enable}) =>
      Future.value(() {});
}

void main() {
  final PreventScreenshotPlatform initialPlatform =
      PreventScreenshotPlatform.instance;

  test('$MethodChannelPreventScreenshot is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPreventScreenshot>());
  });

  test('preventScreenCapture', () async {
    PreventScreenshot preventScreenshotPlugin = PreventScreenshot();
    MockPreventScreenshotPlatform fakePlatform =
        MockPreventScreenshotPlatform();
    PreventScreenshotPlatform.instance = fakePlatform;

    // expect(await preventScreenshotPlugin.preventScreenCapture(), '42');
  });
}
