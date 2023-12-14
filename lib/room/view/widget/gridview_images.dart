import 'dart:convert';

import 'package:flutter/material.dart';

import '../../cubit/room_cubit.dart';

class GridViewIssueImages extends StatelessWidget {
  const GridViewIssueImages({
    super.key,
    required this.index,
    required this.images,
    required this.onFlushPressed,
    required this.onDeleteImagePressed,
    required this.roomCubit,
  });

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
            padding: const EdgeInsets.only(top: 16, left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Прикрепленные фото',
                  style: theme.textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: onFlushPressed,
                  child: const Text('Очистить'),
                )
              ],
            ),
          ),
          Flexible(
            child: GridView.builder(
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
                    child: Image.memory(
                      const Base64Decoder().convert(images[i]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    top: 6,
                    right: 6,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () =>
                            roomCubit.onDeleteImagePressed(index, images[i]),
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
