import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../auth/data/model/user.dart';
import '../../common/widgets/failure_widget.dart';

import '../../home/data/models/room.dart';
import '../cubit/room_cubit.dart';

import '../data/repositories/room_rep.dart';
import 'widget/added_issues_list.dart';
import 'widget/created_issues_list.dart';

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: RoomBuilder(
          builder: (context, state) {
            if (state.fetchStatus != FetchStatus.success) {
              return const SizedBox.shrink();
            }
            return Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => _roomCubit.onCompletePressed(),
                          child: const Text('Завершить')),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: ElevatedButton.icon(
                        onPressed: () => _roomCubit.onAddIssuePressed(),
                        icon: const Icon(Icons.add),
                        label: const Text('Проблема')),
                  )
                ],
              ),
            );
          },
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Номер ${widget.room.roomNumber}'),
        ),
        body: RoomBuilder(
          builder: (context, state) {
            if (state.fetchStatus == FetchStatus.success) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NestedScrollView(
                  body: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      RoomBuilder(
                        builder: (context, state) {
                          return Flexible(
                            child: TabBarView(
                                controller: _tabController,
                                children: [
                                  CreatedIssuesList(
                                    createdIssues: state.createdIssues,
                                  ),
                                  AddedIssuesList(
                                    addedIssues: state.addedIssues,
                                  )
                                ]),
                          );
                        },
                      )
                    ],
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
                            RoomBuilder(
                              buildWhen: (pState, cState) =>
                                  pState.room.arrdate != cState.room.arrdate,
                              builder: (context, state) {
                                return Text(
                                    'Заезд: ${DateFormat('dd.MM.yyyy - HH:mm').format(DateTime.parse(state.room.arrdate))}');
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            RoomBuilder(
                              buildWhen: (pState, cState) =>
                                  pState.room.depdate != cState.room.depdate,
                              builder: (context, state) {
                                return Text(
                                    'Выезд: ${DateFormat('dd.MM.yyyy - HH:mm').format(DateTime.parse(state.room.depdate))}');
                              },
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
                            SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: DecoratedBox(
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
                                    Tab(
                                      child: Text(
                                        'Cозданные',
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        'Новые',
                                      ),
                                    ),
                                  ],
                                  labelColor: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ];
                  },
                ),
              );
            }
            if (state.fetchStatus == FetchStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.fetchStatus == FetchStatus.failure) {
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
