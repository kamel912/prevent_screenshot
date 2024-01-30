import 'prevent_screenshot_platform_interface.dart';

class PreventScreenshot {
  Future<void> preventScreenCapture({bool enable = false}) {
    return PreventScreenshotPlatform.instance
        .preventScreenCapture(enable: enable);
  }
}
