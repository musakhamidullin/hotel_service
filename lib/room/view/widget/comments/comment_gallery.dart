import 'package:flutter/material.dart';

import '../../../data/models/image.dart';
import '../gallery/images_widget.dart';

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
            // FutureBuilder(
            //     future: GetPhotos.getAllPhotos(),
            //     builder: (_, snapshot) {
                  
            //       if (snapshot.hasData) {
            //         return ImagesWidget(
            //           images: snapshot.requireData.$1
            //               .map((e) => ImageModel.fromDevice(e))
            //               .toList(),
            //           onClearPressed: () {},
            //           onDeleteItemPressed: (int i) {},
            //           scrollController: scrollController,
            //           isFromFiles: snapshot.requireData.$2,
            //         );
            //       }
            //       return const SizedBox.shrink();
            //     })
          ],
        );
      },
    );
  }
}
