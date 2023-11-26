import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_service/app/router/router.gr.dart';

import '../../../common/widgets/failure_widget.dart';
import '../../cubit/home_cubit.dart';

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
          itemCount: state.rooms.length,
          itemBuilder: (context, index) {
            final floor = state.rooms.keys.toList()[index];
            final rooms = state.rooms.values.toList()[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Этаж: $floor',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Wrap(
                  children: rooms
                      .map(
                        (e) => Card(
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
                              child: Text(e.number.toString()),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            );
          },
        );
      },
    );
  }
}
