import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/cash_memory_image_provider.dart';
import '../../../../common/widgets/modals.dart';
import 'menu_actions.dart';

class ImagesViewer extends StatefulWidget {
  const ImagesViewer({
    super.key,
    required this.images,
    required this.initImageIndex,
    required this.onRemoved,
  });

  final List<String> images;
  final int initImageIndex;
  final Function() onRemoved;

  @override
  State<ImagesViewer> createState() => _ImagesViewerState();
}

class _ImagesViewerState extends State<ImagesViewer> {
  final _controller = CarouselController();
  late int _currImage = widget.initImageIndex;

  @override
  Widget build(BuildContext context) {
    const sliderIndicatorHeight = 150.0;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Modals.showBottomSheet(
                context,
                MenuActions(
                  onRemoved: widget.onRemoved,
                ),
                showDragHandle: true,
              );
            },
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            carouselController: _controller,
            itemCount: widget.images.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return InteractiveViewer(
                child: Image(
                  image: CacheMemoryImageProvider(
                    tag: widget.images[itemIndex],
                    img:
                        const Base64Decoder().convert(widget.images[itemIndex]),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              initialPage: widget.initImageIndex,
              enableInfiniteScroll: true,
              height: screenHeight - sliderIndicatorHeight - 62,
              viewportFraction: 1.0,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, _) {
                setState(() {
                  _currImage = index;
                });
              },
            ),
          ),
          SizedBox(
            height: sliderIndicatorHeight + 4,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: widget.images.map(
                (e) {
                  final imageIndex = widget.images.indexOf(e);
                  return GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(imageIndex);
                      setState(() {
                        _currImage = imageIndex;
                      });
                    },
                    child: Container(
                      decoration: imageIndex == _currImage
                          ? BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 4,
                              ),
                            )
                          : null,
                      child: Image(
                        image: CacheMemoryImageProvider(
                          tag: e,
                          img: const Base64Decoder().convert(e),
                        ),
                        height: imageIndex == _currImage
                            ? sliderIndicatorHeight
                            : sliderIndicatorHeight + 4,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
