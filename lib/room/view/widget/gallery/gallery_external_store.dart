import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_photos/get_photos.dart';

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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetPhotos.getAllPhotos(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return ImagesWidget(
              images: snapshot.requireData,
              onClearPressed: () {},
              onDeleteItemPressed: (int i) {},
              scrollController: widget.scrollController,
              isFromFiles: true,
            );
          }
          return const SizedBox.shrink();
        });
  }
}
