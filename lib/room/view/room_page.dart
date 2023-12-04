import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';

import '../../home/data/models/room.dart';
import '../cubit/room_cubit.dart';

@RoutePage()
class RoomPage extends StatefulWidget {
  const RoomPage({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  State<RoomPage> createState() => _RoomPageState();
}

typedef RoomBuilder = BlocBuilder<RoomCubit, RoomState>;
typedef RoomListener = BlocListener<RoomCubit, RoomState>;

class _RoomPageState extends State<RoomPage> {
  final _roomCubit = RoomCubit();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _roomCubit.close();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onSelectedFromGalleryPressed(int i) async {
    final images = await ImagePicker().pickMultiImage();

    _roomCubit.onAddImagesPressed((i, images));
  }

  Future<void> _onSelectedCameraPressed(int i) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    _roomCubit.onAddImageFromCameraPressed((i, image));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _roomCubit..fetchRoom(widget.room.id),
      child: RoomListener(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            padding: const EdgeInsets.only(bottom: 16),
            height: 70,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Завершить')),
          ),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Номер ${widget.room.roomNumber}'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              controller: _scrollController,
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Text('Заезд:  10.11.2023 в 15:00'),
                const SizedBox(
                  height: 8,
                ),
                const Text('Выезд:  20.11.2023 в 12:00'),
                const SizedBox(
                  height: 8,
                ),
                const Divider(),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.star),
                  title: Text('VIP'),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.warning_rounded),
                  title: Text('Статус - Грязная'),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.cleaning_services_rounded),
                  title: Text('Влажная уборка'),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.message_rounded),
                  title: Text('Охладить комнату до +17 градусов'),
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                      onPressed: () => _roomCubit.onAddIssuePressed(),
                      icon: const Icon(Icons.add_circle_outline_rounded)),
                  title: const Text('Добавить проблему в номере'),
                ),
                RoomBuilder(
                  builder: (context, state) {
                    return state.issues.isNotEmpty
                        ? ListView.builder(
                            physics: const ScrollPhysics(),
                            controller: _scrollController,
                            padding: const EdgeInsets.only(bottom: 100),
                            itemCount: state.issues.length,
                            shrinkWrap: true,
                            itemBuilder: (_, i) {
                              return Slidable(
                                startActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        icon: Icons.delete,
                                        onPressed: (_) {
                                          _roomCubit.onDeleteIssuePressed(i);
                                        },
                                        borderRadius: BorderRadius.circular(10),
                                        backgroundColor: Colors.red,
                                      )
                                    ]),
                                endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        icon: Icons.delete,
                                        onPressed: (_) {
                                          _roomCubit.onDeleteIssuePressed(i);
                                        },
                                        borderRadius: BorderRadius.circular(10),
                                        backgroundColor: Colors.red,
                                      )
                                    ]),
                                child: Card(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      final theme =
                                                          Theme.of(context);
                                                      return StatefulBuilder(
                                                        builder:
                                                            (_, setModalState) =>
                                                                RoomBuilder(
                                                          bloc: _roomCubit,
                                                          builder:
                                                              (context, state) {
                                                            final images = state
                                                                .issues[i].$2;
                                                            return Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                if (images
                                                                    .isNotEmpty)
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top: 16,
                                                                        bottom:
                                                                            10,
                                                                        left:
                                                                            12),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Прикрепленные фото',
                                                                          style: theme
                                                                              .textTheme
                                                                              .titleMedium,
                                                                        ),
                                                                        TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              _roomCubit.onFlushPressed(i);
                                                                            },
                                                                            child:
                                                                                const Text('Очистить'))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                if (images
                                                                    .isNotEmpty)
                                                                  Expanded(
                                                                    child: ListView
                                                                        .separated(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              12,
                                                                          right:
                                                                              12),
                                                                      separatorBuilder:
                                                                          (_, i) =>
                                                                              const SizedBox(
                                                                        width:
                                                                            6,
                                                                      ),
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      shrinkWrap:
                                                                          true,
                                                                      itemCount:
                                                                          images
                                                                              .length,
                                                                      itemBuilder:
                                                                          (_, i) =>
                                                                              SizedBox(
                                                                        child: Stack(
                                                                            children: [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                child: Image.file(File(images[i].path)),
                                                                              ),
                                                                              Positioned.fill(
                                                                                child: Align(
                                                                                  alignment: Alignment.topRight,
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      setModalState(() {
                                                                                        _roomCubit.onDeleteImagePressed(images[i]);
                                                                                      });
                                                                                    },
                                                                                    child: DecoratedBox(
                                                                                        decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)), color: Colors.white.withOpacity(0.5)),
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
                                                                const SizedBox(
                                                                  height: 8,
                                                                ),
                                                                ListTile(
                                                                  leading:
                                                                      const Icon(
                                                                          Icons
                                                                              .add_photo_alternate_outlined),
                                                                  onTap:
                                                                      () async {
                                                                    await _onSelectedFromGalleryPressed(
                                                                        i);
                                                                  },
                                                                  title: const Text(
                                                                      'Выбрать из галереи'),
                                                                ),
                                                                ListTile(
                                                                  leading:
                                                                      const Icon(
                                                                          Icons
                                                                              .photo_camera_outlined),
                                                                  onTap:
                                                                      () async {
                                                                    await _onSelectedCameraPressed(
                                                                        i);

                                                                    setModalState(
                                                                        () {});
                                                                  },
                                                                  title: const Text(
                                                                      'Сделать фото'),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8),
                                                                  child: SizedBox(
                                                                      width: double
                                                                          .infinity,
                                                                      child: ElevatedButton(
                                                                          onPressed:
                                                                              () {},
                                                                          child:
                                                                              const Text('Отменить'))),
                                                                ),
                                                                const SizedBox(
                                                                  height: 8,
                                                                )
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    });
                                              },
                                              icon: const Icon(
                                                  Icons.attach_file_rounded)),
                                          const Flexible(
                                              child: TextField(
                                            decoration: InputDecoration(
                                                hintText: 'Комментарий...'),
                                            keyboardType:
                                                TextInputType.multiline,
                                            minLines: 1,
                                            maxLines: 5,
                                          )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.mic))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                        : const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
