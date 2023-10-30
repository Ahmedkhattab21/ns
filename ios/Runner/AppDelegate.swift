
import UIKit

import Flutter


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let channel = FlutterMethodChannel(name: "com.example.myapp/myactivity",
                                                    binaryMessenger: controller.binaryMessenger)


        channel.invokeMethod("handleActivity", arguments: ["key": "value"])

        let activity = UserActivityHandler.createActivity()
                          self.window.rootViewController?.userActivity = activity
                          activity.becomeCurrent()



     GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

/*
  channel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in


          })*/
