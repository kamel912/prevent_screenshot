// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'prevent_screenshot_platform_interface.dart';

/// A web implementation of the PreventScreenshotPlatform of the PreventScreenshot plugin.
class PreventScreenshotWeb extends PreventScreenshotPlatform {
  /// Constructs a PreventScreenshotWeb
  PreventScreenshotWeb();

  static void registerWith(Registrar registrar) {
    PreventScreenshotPlatform.instance = PreventScreenshotWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<void> preventScreenCapture({required bool enable}) async {
    return;
  }
}
