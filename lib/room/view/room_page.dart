import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/data/model/user.dart';
import '../../common/widgets/failure_widget.dart';

import '../../home/data/models/room.dart';
import '../../voice_messanger/cubit/voice_manager_cubit.dart';
import '../cubit/room_cubit.dart';

import '../data/repositories/room_rep.dart';
import 'widget/issue_tab.dart';
import 'widget/issues_list.dart';
import 'widget/fabs.dart';
import 'widget/room_info.dart';

@RoutePage()
class RoomPage extends StatefulWidget {
  const RoomPage({
    super.key,
    required this.room,
    required this.user,
  });

  final Room room;
  final User user;

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage>
    with SingleTickerProviderStateMixin {
  late final RoomCubit _roomCubit;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _roomCubit = RoomCubit(roomRep: RoomRep(), user: widget.user);

    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      _roomCubit.onTabChanged(_tabController.index);
    });
  }

  @override
  void dispose() {
    _roomCubit.close();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _roomCubit..fetchRoom(widget.room.id),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BlocBuilder<RoomCubit, RoomState>(
          builder: (context, state) {
            if (state.fetchStatus != FetchStatus.success) {
              return const SizedBox.shrink();
            }
            return Fabs(tabController: _tabController);
          },
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Номер ${widget.room.roomNumber}'),
          centerTitle: true,
        ),
        body: BlocBuilder<RoomCubit, RoomState>(
          builder: (context, state) {
            if (state.failure()) {
              return FailureWidget(
                onPressed: () => _roomCubit.fetchRoom(widget.room.id),
              );
            }

            if (state.loading()) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.success() || state.refreshing()) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RefreshIndicator(
                  notificationPredicate: (notification) {
                    return notification.depth == 2;
                  },
                  onRefresh: () async {
                    await _roomCubit.fetchRoom(widget.room.id, refresh: true);
                  },
                  child: NestedScrollView(
                    headerSliverBuilder: (_, isElevated) {
                      return [
                        const SliverToBoxAdapter(child: RoomInfo()),
                        SliverToBoxAdapter(
                          child: IssueTab(controller: _tabController),
                        ),
                      ];
                    },
                    body: BlocProvider(
                      create: (context) => VoiceManagerCubit(),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          IssuesList(
                              issues: state.issues[0] ?? [],
                              tabName: 'Созданные'),
                          IssuesList(
                              issues: state.issues[1] ?? [],
                              tabName: 'Новые')
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
