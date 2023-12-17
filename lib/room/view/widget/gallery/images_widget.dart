import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../common/widgets/cash_memory_image_provider.dart';

class ImagesWidget extends StatelessWidget {
  const ImagesWidget({
    super.key,
    required this.images,
    required this.onClearPressed,
    required this.onDeleteItemPressed,
    required this.scrollController,
  });

  final List<String> images;
  final VoidCallback onClearPressed;
  final void Function(int i) onDeleteItemPressed;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Прикрепленные фото',
                  style: theme.textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: onClearPressed,
                  child: const Text('Очистить'),
                )
              ],
            ),
          ),
          Flexible(
            child: GridView.builder(
              controller: scrollController,
              itemCount: images.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (_, i) => Stack(
                children: [
                  Positioned.fill(
                    child: Image(
                      image: CacheMemoryImageProvider(
                        tag: images[i],
                        img: const Base64Decoder().convert(images[i]),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    top: 6,
                    right: 6,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => onDeleteItemPressed(i),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black87.withOpacity(0.5)),
                          child: Icon(
                            Icons.cancel_rounded,
                            color: Colors.white.withOpacity(0.8),
                            size: 34,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}