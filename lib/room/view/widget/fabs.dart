import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/modals.dart';
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
          width: 16,
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                final isCreatedExists =
                    context.read<RoomCubit>().state.issues[1]?.isNotEmpty ??
                        false;
                if (isCreatedExists) {
                  final request = await Modals.showConfirmationDialog(context,
                          'Остались неотправленные заявки.\nВы уверены что хотите завершить?') ??
                      false;

                  if (request) {
                    Future.sync(() => Navigator.pop(context));
                  }

                  return;
                }

                Future.sync(() => Navigator.pop(context));
              },
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
          width: 16,
        ),
      ],
    );
  }
}
