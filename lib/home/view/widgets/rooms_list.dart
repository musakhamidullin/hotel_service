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
        if (state.nothingFound()) {
          return const Center(
            child: Text('Ничего не найдено'),
          );
        }
        if (state.loading() && state.rooms.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.failure()) {
          return FailureWidget(
            onPressed: context.read<HomeCubit>().fetchFirstHotelPage,
          );
        }
        return Stack(
          children: [
            if (state.searching())
              const Center(child: CircularProgressIndicator()),
            RefreshIndicator(
              onRefresh: () async {
                await context.read<HomeCubit>().fetchFirstHotelPage();
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(_FloorItem.listPAdding),
                itemCount: state.rooms.length,
                itemBuilder: (context, index) {
                  final floor = state.rooms.keys.toList()[index];
                  final rooms = state.rooms.values.toList()[index];
                  return _FloorItem(floor: floor.toString(), rooms: rooms);
                },
              ),
            ),
          ],
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

  static const listPAdding = 12.0;

  @override
  State<_FloorItem> createState() => _FloorItemState();
}

class _FloorItemState extends State<_FloorItem> {
  var _expanded = true;
  static const spacing = 8.0;
  var _itemWidth = 0.0;

  @override
  void didChangeDependencies() {
    final screenWidth = MediaQuery.of(context).size.width;
    const maxCrossCount = 3;
    _itemWidth =
        (screenWidth - _FloorItem.listPAdding * 2 - maxCrossCount * spacing) /
            maxCrossCount;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    const cardRadius = 12.0;
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
            spacing: spacing,
            runSpacing: spacing,
            children: widget.rooms.map(
              (e) {
                final Color? cleanStatusColor;
                switch (e.cleanStatusId) {
                  case 1:
                    cleanStatusColor = Colors.green[100];
                  case 2:
                    cleanStatusColor = Colors.red[100];
                  case 3:
                    cleanStatusColor = Colors.blue[100];
                  case 4:
                    cleanStatusColor = Colors.yellow[100];
                  default:
                    cleanStatusColor = null;
                }
                final Color? roomStatusColor;
                switch (e.roomStatusId) {
                  case 0:
                    roomStatusColor = Colors.green;
                  case 2 || 5:
                    roomStatusColor = Colors.orange;
                  case 4:
                    roomStatusColor = Colors.red;
                  default:
                    roomStatusColor = Colors.transparent;
                }
                return Card(
                  margin: EdgeInsets.zero,
                  color: cleanStatusColor,
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(cardRadius),
                    ),
                    onTap: () {
                      context.router.push(RoomRoute(
                          room: e,
                          ownerId: context
                              .read<HomeCubit>()
                              .user
                              .personInfo
                              .ownerId));
                    },
                    child: Container(
                      height: 60,
                      width: _itemWidth,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(right: cardRadius),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            width: cardRadius,
                            color: roomStatusColor,
                          ),
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(cardRadius),
                          bottomLeft: Radius.circular(cardRadius),
                        ),
                      ),
                      child: Text(
                        e.roomNumber,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
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
