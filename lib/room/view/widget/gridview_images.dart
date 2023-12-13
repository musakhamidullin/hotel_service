import 'dart:convert';

import 'package:flutter/material.dart';

import '../../cubit/room_cubit.dart';

class GridViewIssueImages extends StatelessWidget {
  const GridViewIssueImages(
      {super.key,
      required this.index,
      required this.images,
      required this.onFlushPressed,
      required this.onDeleteImagePressed,
      required this.roomCubit});

  final int index;
  final List<String> images;
  final VoidCallback onFlushPressed;
  final void Function(int photoIndex) onDeleteImagePressed;
  final RoomCubit roomCubit;

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
          Flexible(
            child: GridView.builder(
                itemCount: images.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (_, i) => Stack(children: [
                      Positioned.fill(
                        child: Image.memory(
                          const Base64Decoder().convert(images[i]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () => roomCubit.onDeleteImagePressed(
                                index, images[i]),
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
                    ])),
          )
        ],
      ),
    );
  }
}
