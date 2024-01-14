package com.example.get_photos;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.provider.MediaStore;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** GetPhotosPlugin */
public class GetPhotosPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  private MethodChannel channel;
  private static final String CHANNEL_NAME = "get_photo";
  private static final String METHOD_GET_ALL_PHOTOS = "getAllPhotos";
  private Activity activity;
  private Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHANNEL_NAME);
    channel.setMethodCallHandler(this);
  }

  @RequiresApi(api = Build.VERSION_CODES.TIRAMISU)
  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals(METHOD_GET_ALL_PHOTOS)) {

      context = activity.getApplicationContext();
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
        if (ContextCompat.checkSelfPermission(context,
            Manifest.permission.READ_MEDIA_IMAGES) == PackageManager.PERMISSION_GRANTED) {
          // Разрешение уже предоставлено, можно получать фотографии
          List<String> photos = getAllPhotos();
          result.success(photos);
        } else {
          // Разрешение не предоставлено, запросить у пользователя
          ActivityCompat.requestPermissions(activity, new String[] { Manifest.permission.READ_MEDIA_IMAGES }, 123);
        }
      } else {
        // Для версий Android ниже 6.0 разрешение предоставлено автоматически
        List<String> photos = getAllPhotos();
        result.success(photos);
      }

      List<String> photos = getAllPhotos();
      result.success(photos);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  private List<String> getAllPhotos() {
    List<String> photos = new ArrayList<>();
    Uri uri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
    String[] projection = { MediaStore.Images.Media.DATA };
    Cursor cursor = context.getContentResolver().query(uri, projection, null, null, null);

    if (cursor != null) {
      while (cursor.moveToNext()) {
        String imagePath = cursor.getString(0);
        photos.add(imagePath);
      }
      cursor.close();
    }
    return photos;
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();
    context = activity.getApplicationContext();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
  }

  @Override
  public void onDetachedFromActivity() {
  }
}
