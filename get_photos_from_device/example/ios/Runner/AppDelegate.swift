import UIKit
import Flutter
import Photos

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let methodChannelName = "get_photo"
        let channelName = "getAllPhotos"
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        let methodChannel = FlutterMethodChannel(name: methodChannelName, binaryMessenger: controller.binaryMessenger)
        
        methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            self?.handleMethodCall(call, result: result)
        }
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getAllPhotos":
            handleGetAllPhotos(result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    func handleGetAllPhotos(result: @escaping FlutterResult) {
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized:
                var photoPaths: [String] = []
                
                let fetchOptions = PHFetchOptions()
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
                
                let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                
                fetchResult.enumerateObjects { asset, index, stop in
                    let options = PHContentEditingInputRequestOptions()
                    options.canHandleAdjustmentData = { _ in return true }
                    
                    asset.requestContentEditingInput(with: options) { (contentEditingInput, info) in
                        if let fullSizePath = contentEditingInput?.fullSizeImageURL?.path {
                            photoPaths.append(fullSizePath)
                        }
                        
                        // Проверяем, обработаны ли все фотографии
                        if index == fetchResult.count - 1 {
                            // Если это последняя фотография, вызываем result
                            result(photoPaths)
                        }
                    }
                }
            default:
                // Обработка отказа пользователя или ограничений доступа
                break
            }
        }
    }
}
