import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../cubit/room_cubit.dart';
import '../room_page.dart';
import 'issue_images.dart';

abstract class IssueModal {
  static Future<void> _onSelectedFromGalleryPressed(
      int i, RoomCubit roomCubit) async {
    final images = await ImagePicker().pickMultiImage();

    roomCubit.onAddImagesPressed((i, images));
  }

  static Future<void> _onSelectedCameraPressed(
      int i, RoomCubit roomCubit) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    roomCubit.onAddImageFromCameraPressed((i, image));
  }

  static void showBottomSheet(
    BuildContext context,
    RoomCubit roomCubit,
    int issueIndex,
  ) =>
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return BlocProvider.value(
              value: roomCubit,
              child: StatefulBuilder(
                builder: (_, setModalState) => RoomBuilder(
                  builder: (context, state) {
                    final images = state.issues[issueIndex].$2;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (images.isNotEmpty)
                          IssueImages(
                            index: issueIndex,
                            images: images,
                            setModalState: setModalState,
                            onFlushPressed: () =>
                                roomCubit.onFlushPressed(issueIndex),
                            onDeleteImagePressed: (photoIndex) {
                              setModalState(() {});

                              roomCubit
                                  .onDeleteImagePressed(images[photoIndex]);
                            },
                          ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.add_photo_alternate_outlined),
                          onTap: () async =>
                              await _onSelectedFromGalleryPressed(
                                  issueIndex, roomCubit),
                          title: const Text('Выбрать из галереи'),
                        ),
                        ListTile(
                          leading: const Icon(Icons.photo_camera_outlined),
                          onTap: () async {
                            await _onSelectedCameraPressed(
                                issueIndex, roomCubit);

                            setModalState(() {});
                          },
                          title: const Text('Сделать фото'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Отменить'))),
                        ),
                        const SizedBox(
                          height: 8,
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          });
}
