package com.example.get_photos;

import static androidx.core.app.ActivityCompat.requestPermissions;

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


public class GetPhotosPlugin implements FlutterPlugin, ActivityAware {
    public GetPhotosMethodCallHandler getPhotosMethodCallHandler;
    private static final String CHECK_PERMISSION_NAME_CHANNEL = "get_permission";
    private static final String GET_PHOTOS_NAME_CHANNEL = "get_photo";
    private static final String METHOD_GET_ALL_PHOTOS = "getAllPhotos";
    private static final String METHOD_CHECK_PERMISSION = "checkReadMedia";

    public Context context;
    private Activity activity;

    public Context getContext() {
        return context;
    }

    public void setContext(Context context) {
        this.context = context;
    }

    private Activity getActivity() {
        return activity;
    }

    private void setActivity(Activity activity) {
        this.activity = activity;
    }

    public GetPhotosMethodCallHandler getPhotosMethodCallHandler() {
        return getPhotosMethodCallHandler;
    }


    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        CheckPermissionMethodCallHandler checkPermissionMethodCallHandler = new CheckPermissionMethodCallHandler();
        MethodChannel checkPermissionChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHECK_PERMISSION_NAME_CHANNEL);
        checkPermissionChannel.setMethodCallHandler(checkPermissionMethodCallHandler);

        getPhotosMethodCallHandler = new GetPhotosMethodCallHandler();
        MethodChannel getPhotosFromDeviceChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), GET_PHOTOS_NAME_CHANNEL);
        getPhotosFromDeviceChannel.setMethodCallHandler(getPhotosMethodCallHandler);
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        setActivity(binding.getActivity());
        setContext(getActivity().getApplicationContext());
    }

    private class CheckPermissionMethodCallHandler implements MethodChannel.MethodCallHandler {
        @Override
        public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
            if (call.method.equals(METHOD_CHECK_PERMISSION)) {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                    isNewBuildCode(result);
                }

                if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.M) {
                    result.success(true);
                }
            } else {
                result.notImplemented();
            }
        }
    }

    public class GetPhotosMethodCallHandler implements MethodChannel.MethodCallHandler {

        @Override
        public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
            if (call.method.equals(METHOD_GET_ALL_PHOTOS)) {
                List<String> photos = getAllPhotos(context);
                result.success(photos);
            } else {
                result.notImplemented();
            }
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.TIRAMISU)
    private void isNewBuildCode(MethodChannel.Result result) {
        int permissionCheck = ContextCompat.checkSelfPermission(getContext(), Manifest.permission.READ_MEDIA_IMAGES);
        if (permissionCheck == PackageManager.PERMISSION_GRANTED) {
            result.success(true);
        } else {
            requestPermissions(getActivity(), new String[]{Manifest.permission.READ_MEDIA_IMAGES}, 1);
        }
    }

    public List<String> getAllPhotos(Context context) {
        List<String> photos = new ArrayList<>();
        Uri uri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
        String[] projection = {MediaStore.Images.Media.DATA};
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
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
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

