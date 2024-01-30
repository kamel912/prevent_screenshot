import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'prevent_screenshot_method_channel.dart';

abstract class PreventScreenshotPlatform extends PlatformInterface {
  /// Constructs a PreventScreenshotPlatform.
  PreventScreenshotPlatform() : super(token: _token);

  static final Object _token = Object();

  static PreventScreenshotPlatform _instance = MethodChannelPreventScreenshot();

  /// The default instance of [PreventScreenshotPlatform] to use.
  ///
  /// Defaults to [MethodChannelPreventScreenshot].
  static PreventScreenshotPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PreventScreenshotPlatform] when
  /// they register themselves.
  static set instance(PreventScreenshotPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> preventScreenCapture({required bool enable}) {
    throw UnimplementedError(
        'preventScreenCapture() has not been implemented.');
  }
}
