import Flutter
import UIKit
import Photos

public class GetPhotosFromDevicePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "get_photo", binaryMessenger: registrar.messenger())
    let instance = GetPhotosFromDevicePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
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
