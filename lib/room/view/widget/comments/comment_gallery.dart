import 'dart:io';

import 'package:flutter/material.dart';

import '../gallery/gallery_external_store.dart';

class CommentGallery extends StatefulWidget {
  const CommentGallery({super.key});

  @override
  State<CommentGallery> createState() => _CommentGalleryState();
}

class _CommentGalleryState extends State<CommentGallery> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 1,
      minChildSize: 0.4,
      initialChildSize: 1,
      builder: (context, scrollController) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ExternalStoreGallery(
              images: (List<File> images) {},
              scrollController: scrollController,
            )
          ],
        );
      },
    );
  }
}
