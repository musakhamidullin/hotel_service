import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../auth/data/repositories/auth_rep.dart';
import '../../../common/widgets/failure_widget.dart';
import '../cubit/my_schedule_cubit.dart';
import '../data/repositories/my_schedule_rep.dart';

@RoutePage()
class MySchedulePage extends StatefulWidget {
  const MySchedulePage({super.key});

  @override
  State<MySchedulePage> createState() => _MySchedulePageState();
}

class _MySchedulePageState extends State<MySchedulePage> {
  late final MyScheduleCubit _scheduleCubit = MyScheduleCubit(
    myScheduleRep: MyScheduleRep(),
    user: context.read<AuthRep>().user,
  );

  @override
  void dispose() {
    _scheduleCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _scheduleCubit..fetchMySchedule(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('График работы'),
        ),
        body: BlocBuilder<MyScheduleCubit, MyScheduleState>(
          builder: (context, state) {
            if (state.failure()) {
              return FailureWidget(
                  onPressed: context.read<MyScheduleCubit>().fetchMySchedule);
            }
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<MyScheduleCubit>().fetchMySchedule();
              },
              child: Stack(
                children: [
                  SfCalendar(
                    view: CalendarView.week,
                    specialRegions: state.schedule,
                  ),
                  if (state.loading())
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
