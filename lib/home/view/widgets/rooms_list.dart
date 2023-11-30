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
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.loading()) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.failure()) {
          return FailureWidget(
            onPressed: () {},
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    color = Colors.green[400];
                  case 2:
                    color = Colors.red[200];
                  case 3:
                    color = Colors.blue[200];
                  case 4:
                    color = Colors.yellow[600];
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
                      height: 50,
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
