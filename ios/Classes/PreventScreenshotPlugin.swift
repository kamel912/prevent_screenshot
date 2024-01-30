import Flutter
import ScreenshotPreventing
import UIKit

public class PreventScreenshotPlugin: NSObject, FlutterPlugin {

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "prevent_screenshot", binaryMessenger: registrar.messenger())
    let instance = PreventScreenshotPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }




  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
         case "preventScreenCapture":
                    guard let args = call.arguments as? Dictionary<String, Any>,
                          let enable = args["enable"] as? Bool else {
                        result(FlutterError(code: "-14", message: "Missing parameters", details: "Missing parameter 'enable'"))
                        return
                    }

                    let controller = window!.rootViewController as! FlutterViewController
                    let contentView = controller.view as! ScreenshotPreventingView
                    contentView.preventScreenCapture = enable

                    result(nil)
                    break;
         default:
      result(FlutterMethodNotImplemented)
    }
  }
}
