import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';
import 'home/data/models/room.dart';
import 'room/view/room_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getTemporaryDirectory();
  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: directory);
  runApp(MaterialApp(
    home: Scaffold(
      body: const RoomPage(
        room: Room(
            id: 106,
            floor: 1,
            cleanStatusId: 1,
            cleaningType: 1,
            roomNumber: '',
            roomStatus: true),
      ),
    ),
  ));
}
