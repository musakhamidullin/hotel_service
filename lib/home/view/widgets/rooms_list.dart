import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/router/router.gr.dart';
import '../../../common/widgets/failure_widget.dart';
import '../../cubit/home_cubit.dart';
import '../../data/models/room.dart';

class RoomsList extends StatelessWidget {
  const RoomsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.loading() && state.rooms.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.failure()) {
          return FailureWidget(
            onPressed: () {},
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: state.rooms.length,
          itemBuilder: (context, index) {
            final floor = state.rooms.keys.toList()[index];
            final rooms = state.rooms.values.toList()[index];
            return _FloorItem(floor: floor.toString(), rooms: rooms);
          },
        );
      },
    );
  }
}

class _FloorItem extends StatefulWidget {
  const _FloorItem({
    required this.floor,
    required this.rooms,
  });

  final String floor;
  final List<Room> rooms;

  @override
  State<_FloorItem> createState() => _FloorItemState();
}

class _FloorItemState extends State<_FloorItem> {
  var _expanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Row(
            children: [
              Text('${widget.floor} этаж'),
              Icon(
                _expanded
                    ? Icons.keyboard_arrow_down_rounded
                    : Icons.keyboard_arrow_right_rounded,
              )
            ],
          ),
        ),
        if (_expanded)
          Wrap(
            children: widget.rooms.map(
              (e) {
                final Color? color;
                switch (e.cleanStatusId) {
                  case 1:
                    color = Colors.green[100];
                  case 2:
                    color = Colors.red[100];
                  case 3:
                    color = Colors.blue[100];
                  case 4:
                    color = Colors.yellow[100];
                  default:
                    color = null;
                }
                return Card(
                  color: color,
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onTap: () {
                      context.router.push(RoomRoute(room: e));
                    },
                    child: Container(
                      height: 60,
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(e.roomNumber),
                    ),
                  ),
                );
              },
            ).toList(),
          )
      ],
    );
  }
}
