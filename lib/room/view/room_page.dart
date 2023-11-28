import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _roomCubit..fetchRoom(widget.room.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Номер ${widget.room.roomNumber}'),
        ),
      ),
    );
  }
}
