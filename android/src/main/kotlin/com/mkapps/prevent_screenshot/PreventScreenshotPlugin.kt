package com.mkapps.prevent_screenshot

import android.app.Activity
import android.view.WindowManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** PreventScreenshotPlugin */
class PreventScreenshotPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var activity: Activity

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "prevent_screenshot")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "preventScreenCapture" -> {
                call.argument<Boolean>("enable")?.let {
                    if (it) {
                        activity.window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
                    } else {
                        activity.window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
                    }

                    result.success(null)
                } ?: run {
                    result.error("-14", "Missing parameters", "Missing parameter 'enable'")
                }
            }

        }

    }


    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }


    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.getActivity()
    }

    override fun onDetachedFromActivityForConfigChanges() {
        // TODO: the Activity your plugin was attached to was destroyed to change configuration.
        // This call will be followed by onReattachedToActivityForConfigChanges().
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        // TODO: your plugin is now attached to a new Activity after a configuration change.
    }

    override fun onDetachedFromActivity() {
        // TODO: your plugin is no longer associated with an Activity. Clean up references.
    }
}
