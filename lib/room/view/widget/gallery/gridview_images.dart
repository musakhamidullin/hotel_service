import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../cubit/room_cubit.dart';

class GridViewIssueImages extends StatefulWidget {
  const GridViewIssueImages({
    super.key,
    required this.index,
    required this.images,
    required this.onFlushPressed,
    required this.onDeleteImagePressed,
    required this.roomCubit,
    required this.scrollController,
  });

  final int index;
  final List<String> images;
  final VoidCallback onFlushPressed;
  final void Function(int photoIndex) onDeleteImagePressed;
  final RoomCubit roomCubit;
  final ScrollController scrollController;

  @override
  State<GridViewIssueImages> createState() => _GridViewIssueImagesState();
}

class _GridViewIssueImagesState extends State<GridViewIssueImages> {
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
                  onPressed: widget.onFlushPressed,
                  child: const Text('Очистить'),
                )
              ],
            ),
          ),
          Flexible(
            child: GridView.builder(
              controller: widget.scrollController,
              itemCount: widget.images.length,
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
                      const Base64Decoder().convert(widget.images[i]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    top: 6,
                    right: 6,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => widget.roomCubit.onDeleteImagePressed(
                            widget.index, widget.images[i]),
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
