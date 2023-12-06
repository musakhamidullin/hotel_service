import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../home/data/models/room.dart';
import '../cubit/room_cubit.dart';
import 'widget/issue_card.dart';
import 'widget/issue_modal.dart';

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

  ActionPane actionPane(int indexIssue) =>
      ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          icon: Icons.delete,
          onPressed: (_) => _roomCubit.onDeleteIssuePressed(indexIssue),
          borderRadius: BorderRadius.circular(10),
          backgroundColor: Colors.red,
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _roomCubit
        ..fetchRoom(widget.room.id)
        ..fetchDepartment(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          padding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
          height: 70,
          width: double.infinity,
          child:
              ElevatedButton(onPressed: () {}, child: const Text('Завершить')),
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
                          itemBuilder: (_, issueIndex) {
                            return Slidable(
                                startActionPane: actionPane(issueIndex),
                                endActionPane: actionPane(issueIndex),
                                child: IssueCard(
                                    index: issueIndex,
                                    departments: state.departments,
                                    onAttachedFielPressed: () =>
                                        IssueModal.showBottomSheet(
                                            context, _roomCubit, issueIndex)));
                          })
                      : const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
