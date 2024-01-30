#ifndef FLUTTER_PLUGIN_PREVENT_SCREENSHOT_PLUGIN_H_
#define FLUTTER_PLUGIN_PREVENT_SCREENSHOT_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace prevent_screenshot {

class PreventScreenshotPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PreventScreenshotPlugin();

  virtual ~PreventScreenshotPlugin();

  // Disallow copy and assign.
  PreventScreenshotPlugin(const PreventScreenshotPlugin&) = delete;
  PreventScreenshotPlugin& operator=(const PreventScreenshotPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace prevent_screenshot

#endif  // FLUTTER_PLUGIN_PREVENT_SCREENSHOT_PLUGIN_H_
