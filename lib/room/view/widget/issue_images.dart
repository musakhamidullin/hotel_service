import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class IssueImages extends StatelessWidget {
  const IssueImages(
      {super.key,
      required this.index,
      required this.images,
      required this.setModalState,
      required this.onFlushPressed,
      required this.onDeleteImagePressed});

  final int index;
  final List<XFile> images;
  final StateSetter setModalState;
  final VoidCallback onFlushPressed;
  final void Function(int photoIndex) onDeleteImagePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 10, left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Прикрепленные фото',
                  style: theme.textTheme.titleMedium,
                ),
                TextButton(
                    onPressed: onFlushPressed, child: const Text('Очистить'))
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 12, right: 12),
              separatorBuilder: (_, i) => const SizedBox(
                width: 6,
              ),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: images.length,
              itemBuilder: (_, i) => SizedBox(
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(File(images[i].path)),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => onDeleteImagePressed(i),
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                color: Colors.white.withOpacity(0.5)),
                            child: const Icon(
                              Icons.close,
                            )),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
