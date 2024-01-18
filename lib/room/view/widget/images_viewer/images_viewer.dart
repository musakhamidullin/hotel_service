import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/cash_memory_image_provider.dart';
import '../../../../common/widgets/modals.dart';
import '../../../data/models/image.dart';
import 'menu_actions.dart';

class ImagesViewer extends StatefulWidget {
  const ImagesViewer({
    super.key,
    required this.images,
    required this.initImageIndex,
    this.onChanged,
  });

  final List<ImageModel> images;
  final int initImageIndex;
  final void Function(List<ImageModel>)? onChanged;

  @override
  State<ImagesViewer> createState() => _ImagesViewerState();
}

class _ImagesViewerState extends State<ImagesViewer> {
  final _controller = CarouselController();
  late int _currImage = widget.initImageIndex;
  late final _images = [...widget.images];

  int indexAfterDeletedOperation = 0;

  @override
  Widget build(BuildContext context) {
    if (_images.isEmpty) return const SizedBox.shrink();

    const sliderIndicatorHeight = 150.0;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          if (widget.onChanged != null)
            IconButton(
              onPressed: () {
                Modals.showBottomSheet(
                  context,
                  MenuActions(
                    onRemoved: () {
                      _currImage = indexAfterDeletedOperation;
                      setState(() {
                        _images.removeAt(_currImage);
                      });
                      if (_images.length > 1) _controller.nextPage();

                      widget.onChanged!(_images);

                      if (_images.isEmpty) Navigator.pop(context);
                    },
                  ),
                  showDragHandle: true,
                );
              },
              icon: const Icon(Icons.more_vert),
            )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CarouselSlider.builder(
            carouselController: _controller,
            itemCount: _images.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              indexAfterDeletedOperation = itemIndex;
              return _images[itemIndex].isFromApi
                  ? Image.network(_images[itemIndex].image)
                  : InteractiveViewer(
                      child: Image(
                        image: CacheMemoryImageProvider(
                          tag: _images[itemIndex].image,
                          img: const Base64Decoder()
                              .convert(_images[itemIndex].image),
                        ),
                      ),
                    );
            },
            options: CarouselOptions(
              initialPage: widget.initImageIndex,
              enableInfiniteScroll: true,
              height: screenHeight - sliderIndicatorHeight - 112,
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
              children: _images.map(
                (e) {
                  final imageIndex = _images.indexOf(e);
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
                      child: e.isFromApi
                          ? Image.network(e.image)
                          : Image(
                              image: CacheMemoryImageProvider(
                                tag: e.image,
                                img: const Base64Decoder().convert(e.image),
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
