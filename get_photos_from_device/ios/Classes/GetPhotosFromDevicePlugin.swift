import Flutter
import UIKit
import Photos

public class GetPhotosFromDevicePlugin: NSObject, FlutterPlugin {
    private var getPhotosChannel: FlutterMethodChannel!
    private var checkPermissionChannel: FlutterMethodChannel!
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = GetPhotosFromDevicePlugin()
        
        instance.getPhotosChannel = FlutterMethodChannel(name: "get_photo", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: instance.getPhotosChannel)
        
        instance.checkPermissionChannel = FlutterMethodChannel(name: "get_permission", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: instance.checkPermissionChannel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getAllPhotos":
            handleGetAllPhotos(result: result)
        case "checkReadMedia":
            checkPhotoLibraryPermission(result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func checkPhotoLibraryPermission(result: @escaping FlutterResult) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized, .limited:
            result(true)
        case .denied, .restricted:
            showPermissionAlert()
            result(false)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { newStatus in
                DispatchQueue.main.async {
                    if #available(iOS 14, *) {
                        if newStatus == .authorized || newStatus == .limited{
                            result(true)
                        }
                    } else {
                        self.showPermissionAlert()
                    }
                }
                
            }
            
        @unknown default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func showPermissionAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Доступ к фотографиям",
                message: "Для полноценной работы приложения необходим доступ к фотографиям. Вы можете изменить настройки доступа в настройках вашего устройства.",
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(title: "Открыть настройки", style: .default, handler: { _ in
                if let settingsUrl = URL(string: UIApplication.openSettingsURLString),
                   UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl)
                }
            }))
            
            alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
            
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
        }
    }
    
    private func handleGetAllPhotos(result: @escaping FlutterResult) {
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized, .limited:
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
                        if index == fetchResult.count - 1 {
                            result(photoPaths)
                        }
                    }
                }
                
            case .denied, .restricted:
                self.showPermissionAlert()
                result(FlutterMethodNotImplemented)
                
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }
}
