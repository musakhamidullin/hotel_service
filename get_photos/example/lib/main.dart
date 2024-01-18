import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final StreamController<List<String>> _streamController;

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final result = await MyPluginName.isCheckPermission();
              await Future.sync(() => ScaffoldMessenger.of(context)
                  .showSnackBar(
                      SnackBar(content: Text('Permission is: $result'))));

              await Future.sync(() async {
                final photos = await MyPluginName.getAllPhotos(result);

                _streamController.add(photos);
              });
            },
          ),
          appBar: AppBar(title: const Text('My Plugin Example')),
          body: Center(
            child: StreamBuilder<List<String>>(
              stream: _streamController.stream,
              builder:
                  (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.requireData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.file(File(snapshot.data![index])),
                        title: Text(snapshot.data![index]),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}

class MyPluginName {
  static const MethodChannel _channelGetPhoto = MethodChannel('get_photo');
  static const MethodChannel _channelCheckPermission =
      MethodChannel('get_permission');

  static Future<bool> isCheckPermission() async {
    try {
      final result =
          await _channelCheckPermission.invokeMethod('checkReadMedia') as bool;
      return result;
    } on PlatformException catch (e) {
      print("Failed to get permission: '${e.message}'.");
    }
    return false;
  }

  static Future<void> getResultInMethodCall() async {
    await _channelGetPhoto.invokeMethod('getResult');
  }

  static Future<List<String>> getAllPhotos(bool isAllow) async {
    if (!isAllow) return [];
    List<String> photos = [];
    try {
      final List<dynamic> result =
          await _channelGetPhoto.invokeMethod('getAllPhotos');
      for (final photo in result) {
        photos.add(photo as String);
      }
    } on PlatformException catch (e) {
      print("Failed to get all photos: '${e.message}'.");
    }
    return photos;
  }
}
