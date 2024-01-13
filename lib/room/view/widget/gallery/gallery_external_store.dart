import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'images_widget.dart';

class ExternalStoreGallery extends StatefulWidget {
  const ExternalStoreGallery(
      {super.key, required this.images, required this.scrollController});

  final void Function(List<File> images) images;
  final ScrollController scrollController;

  @override
  State<ExternalStoreGallery> createState() => _ExternalStoreGalleryState();
}

class _ExternalStoreGalleryState extends State<ExternalStoreGallery> {
  Future<List<FileSystemEntity>> getImages() async {
    final directories = Directory('/storage/emulated/0');
    List<FileSystemEntity> entities = await directories.list().toList();
    List<FileSystemEntity> finalEntities = [];
    entities.removeWhere((entity) {
      return entity.path == '/storage/emulated/0/Android';
    });
    for (var entity in entities) {
      if (entity is Directory) {
        try {
          var sub = await entity.list(recursive: true).toList();
          finalEntities.addAll(sub);
        } catch (e) {
          rethrow;
        }
      }
    }

    final externals = directories
        .listSync()
        .where((e) =>
            (e.path.contains('jpg') ||
                e.path.contains('jpeg') ||
                e.path.contains('png')) &&
            e is File &&
            !e.path.contains('.trashed') &&
            !e.path.contains('.thumbnails'))
        .toList();

    final filtered = finalEntities.where((e) =>
        (e.path.contains('jpg') ||
            e.path.contains('jpeg') ||
            e.path.contains('png')) &&
        !e.path.contains('.trashed') &&
        !e.path.contains('.thumbnails'));

    return [...filtered, ...externals];
  }

  Stream<String> toBytesFiles(List<FileSystemEntity> files) async* {
    for (final file in files) {
      yield await convertFileToImage(File(file.path));
    }
  }

  Future<String> convertFileToImage(File picture) async {
    List<int> imageBase64 = picture.readAsBytesSync();
    String imageAsString = base64Encode(imageBase64);

    return imageAsString;
  }

  Future<List<String>> getResult() async {
    final List<String> images = [];

    final imagesFromStore = await getImages();

    final stream = toBytesFiles(imagesFromStore);

    stream.listen((event) {
      images.add(event);
    });

    return images;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getResult(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return ImagesWidget(
                images: snapshot.requireData,
                onClearPressed: () {},
                onDeleteItemPressed: (int i) {},
                scrollController: widget.scrollController);
          }
          return const Placeholder();
        });
  }
}
