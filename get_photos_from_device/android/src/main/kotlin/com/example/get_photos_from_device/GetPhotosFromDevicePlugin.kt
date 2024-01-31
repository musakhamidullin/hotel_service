package com.example.get_photos_from_device

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import android.provider.MediaStore
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat.requestPermissions
import androidx.core.app.ActivityCompat.shouldShowRequestPermissionRationale
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class GetPhotosFromDevicePlugin : FlutterPlugin, ActivityAware {

  private lateinit var context: Context
  private lateinit var activity: Activity

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    val checkPermissionChannel = MethodChannel(binding.binaryMessenger, GET_PERMISSION_CHANNEL)
    checkPermissionChannel.setMethodCallHandler(PermissionHandler())
    val getPhotosFromDeviceChannel = MethodChannel(binding.binaryMessenger, GET_PHOTOS_NAME_CHANNEL)
    getPhotosFromDeviceChannel.setMethodCallHandler(PhotosHandler())
  }

  private inner class PermissionHandler : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
      if (call.method == "checkReadMedia") {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
          checkReadMediaPermission(result)
        }
        if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.R) {
          result.success(true)
        }
      } else {
        result.notImplemented()
      }
    }

    @RequiresApi(api = Build.VERSION_CODES.TIRAMISU)
    private fun checkReadMediaPermission(result: MethodChannel.Result) {
      resultPermissionHandler = result
      val permissionCheck = ContextCompat.checkSelfPermission(context, Manifest.permission.READ_MEDIA_IMAGES)
      if (permissionCheck == PackageManager.PERMISSION_GRANTED) {
        result.success(true)
      } else {
        if (!shouldShowRequestPermissionRationale(activity, Manifest.permission.READ_MEDIA_IMAGES)) {
          requestPermissions(activity, arrayOf(Manifest.permission.READ_MEDIA_IMAGES), REQUEST_CODE)
          return;
        }
        result.success(false)
      }
    }
  }

  private inner class PhotosHandler : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
      if (call.method == METHOD_GET_ALL_PHOTOS) {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
          if (isDeniedPermission()) {
            result.error("", "READ_MEDIA_IMAGES - DENIED", "")
            return
          }
        }

        val photos: List<String> = allPhotos
        result.success(photos)
      } else {
        result.notImplemented()
      }
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    private fun isDeniedPermission(): Boolean {
      return ContextCompat.checkSelfPermission(context, Manifest.permission.READ_MEDIA_IMAGES) == PackageManager.PERMISSION_DENIED
    }
  }


  val allPhotos: List<String>
    get() {
      val photos: MutableList<String> = ArrayList()
      val uri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI
      val projection = arrayOf(MediaStore.Images.Media.DATA)
      val cursor = context.contentResolver.query(uri, projection, null, null, null)
      if (cursor != null) {
        while (cursor.moveToNext()) {
          val imagePath = cursor.getString(0)
          photos.add(imagePath)
        }
        cursor.close()
      }
      return photos
    }

  companion object {
    var resultPermissionHandler: MethodChannel.Result? = null;

    private const val GET_PHOTOS_NAME_CHANNEL = "get_photo"
    private const val GET_PERMISSION_CHANNEL = "get_permission"
    private const val METHOD_GET_ALL_PHOTOS = "getAllPhotos"

    const val REQUEST_CODE = 1;
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    context = binding.activity.applicationContext
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    TODO("Not yet implemented")
  }

  override fun onDetachedFromActivity() {
    TODO("Not yet implemented")
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    TODO("Not yet implemented")
  }
}
