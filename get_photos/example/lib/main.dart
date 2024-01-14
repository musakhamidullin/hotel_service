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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My Plugin Example')),
        body: Center(
          child: FutureBuilder<List<String>>(
            future: MyPluginName.getAllPhotos(),
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
      ),
    );
  }
}

class MyPluginName {
  static const MethodChannel _channel = MethodChannel('get_photo');

  static Future<List<String>> getAllPhotos() async {
    List<String> photos = [];
    try {
      final List<dynamic> result = await _channel.invokeMethod('getAllPhotos');
      for (final photo in result) {
        photos.add(photo as String);
      }
    } on PlatformException catch (e) {
      print("Failed to get all photos: '${e.message}'.");
    }
    return photos;
  }
}
