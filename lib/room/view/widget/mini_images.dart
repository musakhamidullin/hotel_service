import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../common/widgets/cash_memory_image_provider.dart';
import 'images_viewer/images_viewer.dart';


class MiniImagesIssueCard extends StatelessWidget {
  const MiniImagesIssueCard({
    super.key,
    required this.index,
    required this.images,
  });

  final int index;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        const maxCrossCount = 3;
        const padding = 4.0;
        final imageWidth =
            (constrains.maxWidth - padding * maxCrossCount * 2) / maxCrossCount;
        final imagesWidget = images
            .map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagesViewer(
                        images: images,
                        initImageIndex: images.indexOf(e),
                        onRemoved: () {

                        },
                      ),
                    ),
                  );
                },
                child: _ImageItem(
                  image: e,
                  index: index,
                  width: imageWidth,
                ),
              ),
            )
            .toList();
        if (images.length >= maxCrossCount) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              imagesWidget[0],
              imagesWidget[1],
              if (images.length > maxCrossCount)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    imagesWidget[2],
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: Center(
                        child: Text(
                          '+${images.length - maxCrossCount}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                  ],
                )
              else
                imagesWidget[2],
            ],
          );
        } else if (images.isNotEmpty && images.length < maxCrossCount) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: imagesWidget
                .map((e) => Padding(
                      padding: const EdgeInsets.only(right: padding * 2),
                      child: e,
                    ))
                .toList(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _ImageItem extends StatelessWidget {
  const _ImageItem({
    required this.image,
    required this.index,
    required this.width,
  });

  final int index;
  final String image;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image(
        image: CacheMemoryImageProvider(
          tag: image,
          img: const Base64Decoder().convert(image),
        ),
        fit: BoxFit.cover,
        height: 150,
        width: width,
      ),
    );
  }
}
