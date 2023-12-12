import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../auth/data/model/user.dart';
import '../../common/widgets/failure_widget.dart';

import '../../home/data/models/room.dart';
import '../../voice_messanger/cubit/voice_manager_cubit.dart';
import '../cubit/room_cubit.dart';

import '../data/repositories/room_rep.dart';
import 'widget/added_issues_list.dart';
import 'widget/created_issues_list.dart';
import 'widget/fabs.dart';

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

typedef RoomBuilder = BlocBuilder<RoomCubit, RoomState>;
typedef RoomListener = BlocListener<RoomCubit, RoomState>;

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
        floatingActionButton: RoomBuilder(
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
        body: RoomBuilder(
          builder: (context, state) {
            if (state.success()) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NestedScrollView(
                  body: BlocProvider(
                    create: (context) => VoiceManagerCubit(),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        CreatedIssuesList(createdIssues: state.createdIssues),
                        AddedIssuesList(addedIssues: state.addedIssues)
                      ],
                    ),
                  ),
                  headerSliverBuilder: (_, isElevated) {
                    return [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text('Заезд'),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        DateFormat()
                                            .add_Hm()
                                            .add_yMMMd()
                                            .format(DateTime.parse(
                                                state.room.arrdate)),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text('Выезд'),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        DateFormat()
                                            .add_Hm()
                                            .add_yMMMd()
                                            .format(DateTime.parse(
                                                state.room.depdate)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Divider(),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.star),
                              title: RoomBuilder(
                                buildWhen: (pState, cState) =>
                                    pState.room.roomType !=
                                    cState.room.roomType,
                                builder: (context, state) {
                                  return Text(state.room.roomType);
                                },
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.warning_rounded),
                              title: RoomBuilder(
                                buildWhen: (pState, cState) =>
                                    pState.room.cleanStatusName !=
                                    cState.room.cleanStatusName,
                                builder: (context, state) {
                                  return Text(state.room.cleanStatusName);
                                },
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading:
                                  const Icon(Icons.cleaning_services_rounded),
                              title: RoomBuilder(
                                buildWhen: (pState, cState) =>
                                    pState.room.cleaningTypeName !=
                                    cState.room.cleaningTypeName,
                                builder: (context, state) {
                                  return Text(state.room.cleaningTypeName);
                                },
                              ),
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.grey.withOpacity(0.2)),
                          child: TabBar(
                            controller: _tabController,
                            dividerHeight: 0,
                            splashBorderRadius: BorderRadius.circular(24),
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5)),
                            indicatorColor: Colors.transparent,
                            indicatorPadding: EdgeInsets.zero,
                            indicatorWeight: 0,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelPadding: EdgeInsets.zero,
                            tabs: const [
                              Tab(child: Text('Cозданные')),
                              Tab(child: Text('Новые')),
                            ],
                            labelColor: Colors.black,
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              );
            }
            if (state.loading()) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.failure()) {
              return FailureWidget(
                onPressed: () => _roomCubit.fetchRoom(widget.room.id),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
