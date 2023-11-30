import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class _RoomPageState extends State<RoomPage> {
  final _roomCubit = RoomCubit();

  @override
  void dispose() {
    _roomCubit.close();
    super.dispose();
  }

  Future<void> _onSelectedFromGalleryPressed() async {
    _selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {});
  }

  Future<void> _onSelectedCameraPressed() async {
    _selectedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {});
  }

  Future<void> _onDeleteImagePressed() async {
    _selectedImage = null;

    setState(() {});
  }

  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _roomCubit..fetchRoom(widget.room.id),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Номер ${widget.room.number}'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ListTile(
                                    onTap: () async {
                                      await _onSelectedFromGalleryPressed();
                                    },
                                    title: const Text('Выбрать из галереи'),
                                  ),
                                  ListTile(
                                    onTap: () async {
                                      await _onSelectedCameraPressed();
                                    },
                                    title: const Text('Сделать фото'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            child: const Text('Отменить'))),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.add_a_photo_rounded)),
                  const Flexible(
                      child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                  )),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.mic))
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              _selectedImage != null
                  ? Stack(
                      children: [
                        SizedBox(
                            height: 200,
                            child: Image.file(File(_selectedImage!.path))),
                        GestureDetector(
                          onTap: () async {
                            await _onDeleteImagePressed();
                          },
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Colors.white.withOpacity(0.2)),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              )),
                        )
                      ],
                    )
                  : const SizedBox.shrink(),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                height: 70,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Завершить')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
