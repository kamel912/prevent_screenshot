import Flutter
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
      guard let args = call.arguments as? [String: Any],
            let enable = args["enable"] as? Bool else {
        result(FlutterError(code: "-14", message: "Missing parameters", details: "Missing parameter 'enable'"))
        return
      }

      if enable {
        enableScreenCapturePrevention()
      } else {
        disableScreenCapturePrevention()
      }

      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func enableScreenCapturePrevention() {
    NotificationCenter.default.addObserver(self, selector: #selector(screenCaptureStatusChanged),
                                           name: UIScreen.capturedDidChangeNotification, object: nil)

    NotificationCenter.default.addObserver(self, selector: #selector(userDidTakeScreenshot),
                                           name: UIApplication.userDidTakeScreenshotNotification, object: nil)

    if UIScreen.main.isCaptured {
      applyBlurOverlay()
    }
  }

  private func disableScreenCapturePrevention() {
    NotificationCenter.default.removeObserver(self, name: UIScreen.capturedDidChangeNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIApplication.userDidTakeScreenshotNotification, object: nil)

    removeBlurOverlay()
  }

  @objc private func screenCaptureStatusChanged() {
    if UIScreen.main.isCaptured {
      applyBlurOverlay()
    } else {
      removeBlurOverlay()
    }
  }

  @objc private func userDidTakeScreenshot() {
    print("User took a screenshot!")
  }

  private func applyBlurOverlay() {
    if let window = UIApplication.shared.windows.first {
      let blurEffect = UIBlurEffect(style: .dark)
      let blurEffectView = UIVisualEffectView(effect: blurEffect)
      blurEffectView.frame = window.frame
      blurEffectView.tag = 999
      window.addSubview(blurEffectView)
    }
  }

  private func removeBlurOverlay() {
    if let window = UIApplication.shared.windows.first,
       let blurView = window.viewWithTag(999) {
      blurView.removeFromSuperview()
    }
  }
}
