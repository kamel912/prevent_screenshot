#include "include/prevent_screenshot/prevent_screenshot_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "prevent_screenshot_plugin.h"

void PreventScreenshotPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  prevent_screenshot::PreventScreenshotPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
