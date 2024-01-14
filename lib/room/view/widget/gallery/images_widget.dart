import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../common/widgets/cash_memory_image_provider.dart';
import 'add_photos.dart';

class ImagesWidget extends StatelessWidget {
  const ImagesWidget(
      {super.key,
      required this.images,
      required this.onClearPressed,
      required this.onDeleteItemPressed,
      required this.scrollController,
      this.isFromFiles = false});

  final List<String> images;
  final VoidCallback onClearPressed;
  final void Function(int i) onDeleteItemPressed;
  final ScrollController scrollController;
  final bool isFromFiles;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        children: [
          if (!isFromFiles)
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 16, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Прикрепленные фото',
                      style: theme.textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FilledButton.tonal(
                    onPressed: onClearPressed,
                    child: const Text('Очистить'),
                  )
                ],
              ),
            ),
          if (images.isEmpty)
            AddPhotos(
              isFromFiles: isFromFiles,
            ),
          if (images.isNotEmpty)
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
                      child: isFromFiles
                          ? Image.file(
                              File(images[i]),
                              fit: BoxFit.cover,
                            )
                          : Image(
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
