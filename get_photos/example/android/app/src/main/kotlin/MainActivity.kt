
package com.example.get_photos_example

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.provider.MediaStore
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

public class MainActivity : FlutterActivity(), ActivityCompat.OnRequestPermissionsResultCallback {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // Регистрируйте плагины здесь
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val checkPermissionChannel = MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, GET_PERMISSION_CHANNEL)
        checkPermissionChannel.setMethodCallHandler(PermissionHandler())
        val getPhotosFromDeviceChannel = MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, GET_PHOTOS_NAME_CHANNEL)
        getPhotosFromDeviceChannel.setMethodCallHandler(PhotosHandler())
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
    }

    private inner class PermissionHandler : MethodChannel.MethodCallHandler {
        override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
            if (call.method == "checkReadMedia") {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                    checkReadMediaPermission(result)
                }
                if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.M) {
                    result.success(true)
                }
            } else {
                result.notImplemented()
            }
        }
        @RequiresApi(api = Build.VERSION_CODES.TIRAMISU)
        private fun checkReadMediaPermission(result: MethodChannel.Result) {
            val permissionCheck = ContextCompat.checkSelfPermission(this@MainActivity, Manifest.permission.READ_MEDIA_IMAGES)
            if (permissionCheck == PackageManager.PERMISSION_GRANTED) {
                result.success(true)
            } else {
                requestPermissions(arrayOf(Manifest.permission.READ_MEDIA_IMAGES), 1)
            }
        }
    }

    private inner class PhotosHandler : MethodChannel.MethodCallHandler {
        override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
            if (call.method == METHOD_GET_ALL_PHOTOS) {
                val photos: List<String> = allPhotos
                result.success(photos)
            } else {
                result.notImplemented()
            }
        }
    }

    val allPhotos: List<String>
        get() {
            val photos: MutableList<String> = ArrayList()
            val uri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI
            val projection = arrayOf(MediaStore.Images.Media.DATA)
            val cursor = contentResolver.query(uri, projection, null, null, null)
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
        private const val GET_PHOTOS_NAME_CHANNEL = "get_photo"
        private const val GET_PERMISSION_CHANNEL = "get_permission"
        private const val METHOD_GET_ALL_PHOTOS = "getAllPhotos"
    }
}