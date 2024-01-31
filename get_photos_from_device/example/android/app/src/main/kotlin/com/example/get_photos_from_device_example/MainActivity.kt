package com.example.get_photos_from_device_example

import android.Manifest
import android.content.pm.PackageManager
import androidx.core.content.ContextCompat
import com.example.get_photos_from_device.GetPhotosFromDevicePlugin
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {

    // Обработка результатов разрешения
    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        if (requestCode == GetPhotosFromDevicePlugin.REQUEST_CODE) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                // Добавьте проверку на одобрение разрешения
                if (ContextCompat.checkSelfPermission(context, Manifest.permission.READ_MEDIA_IMAGES)
                    == PackageManager.PERMISSION_GRANTED
                ) {
                    GetPhotosFromDevicePlugin.resultPermissionHandler?.success(true)
                } else {
                    GetPhotosFromDevicePlugin.resultPermissionHandler?.success(false)
                }
            } else {
                GetPhotosFromDevicePlugin.resultPermissionHandler?.success(false)
            }
            GetPhotosFromDevicePlugin.resultPermissionHandler = null
        }
    }
}
