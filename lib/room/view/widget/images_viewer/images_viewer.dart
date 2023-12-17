import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/cash_memory_image_provider.dart';

class ImagesViewer extends StatelessWidget {
  const ImagesViewer({
    super.key,
    required this.images,
    required this.initImageIndex,
  });

  final List<String> images;
  final int initImageIndex;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return InteractiveViewer(
            child: Image(
              image: CacheMemoryImageProvider(
                tag: images[itemIndex],
                img: const Base64Decoder().convert(images[itemIndex]),
              ),
            ),
          );
        },
        options: CarouselOptions(
          initialPage: initImageIndex,
          height: screenHeight,
          viewportFraction: 1.0,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
