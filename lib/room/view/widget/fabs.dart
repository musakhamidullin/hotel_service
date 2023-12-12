import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/room_cubit.dart';

class Fabs extends StatelessWidget {
  const Fabs({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: context.read<RoomCubit>().onCompletePressed,
              child: const Text('Завершить'),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        IconButton.filled(
          iconSize: 34,
          onPressed: () {
            context.read<RoomCubit>().onAddIssuePressed();

            if (tabController.index != 1) {
              tabController.animateTo(1);
            }
          },
          icon: const Icon(Icons.add),
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
