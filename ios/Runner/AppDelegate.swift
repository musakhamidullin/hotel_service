import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func applicationDidBecomeActive(_ application: UIApplication) {
        if let rootViewController = self.window?.rootViewController as? FlutterViewController {
            let methodChannelName = "get_photo"
            let channelName = "getAllPhotos"
            
            let methodChannel = FlutterMethodChannel(name: methodChannelName, binaryMessenger: rootViewController.binaryMessenger)
            
            methodChannel.invokeMethod(channelName, arguments: nil)
        }
    }
}
