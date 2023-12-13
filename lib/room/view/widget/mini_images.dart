import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/room_cubit.dart';
import 'carousel_images.dart';
import 'listview_builder.dart';

class MiniImagesIssueCard extends StatelessWidget {
  const MiniImagesIssueCard(
      {super.key, required this.index, required this.images});

  final int index;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ListViewBuilder(
                padding: EdgeInsets.zero,
                isHorizontal: true,
                isSeparated: true,
                separatorBuilder: (_, i) => const SizedBox(
                      width: 6,
                    ),
                items: images,
                itemBuilder: (_, i) {
                  final image = images[i];
                  return Stack(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CarouselImagesIssue()));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                            Image.memory(const Base64Decoder().convert(image)),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => context
                              .read<RoomCubit>()
                              .onDeleteImagePressed(index, image),
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
                  ]);
                }),
          ),
          const SizedBox(
            height: 4,
          ),
          Text('Кол-во фотографий: ${images.length}')
        ],
      ),
    );
  }
}
