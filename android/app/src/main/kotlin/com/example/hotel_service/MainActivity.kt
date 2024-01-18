package com.example.hotel_service

import android.content.pm.PackageManager
import androidx.core.app.ActivityCompat.OnRequestPermissionsResultCallback
import com.example.get_photos.GetPhotosPlugin
import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity(), OnRequestPermissionsResultCallback {
    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
        if (requestCode == GetPhotosPlugin.GET_IMAGE_CODE_REQUEST) {
            if (grantResults[0] == PackageManager.PERMISSION_DENIED) {
//                GetPhotosPlugin.failureResultExecution()
            }
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
//                GetPhotosPlugin.successResultExecution()
            }
        }
    }
}
