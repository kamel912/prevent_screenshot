import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'prevent_screenshot_platform_interface.dart';

/// An implementation of [PreventScreenshotPlatform] that uses method channels.
class MethodChannelPreventScreenshot extends PreventScreenshotPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('prevent_screenshot');

  @override
  Future<void> preventScreenCapture({required bool enable}) async {
    await methodChannel.invokeMethod<String>(
      'preventScreenCapture',
      {
        'enable': enable,
      },
    );
  }
}
