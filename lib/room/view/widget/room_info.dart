import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubit/room_cubit.dart';

class RoomInfo extends StatelessWidget {
  const RoomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = Localizations.localeOf(context);
    return BlocBuilder<RoomCubit, RoomState>(
      builder: (context, state) {
        return Column(
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
                      if (state.room.arrdate.isNotEmpty)
                        Text(
                          DateFormat.yMMMEd(
                              localizations.languageCode)
                              .format(DateTime.parse(
                              state.room.arrdate)),
                        ),
                      if (state.room.arrdate.isEmpty)
                        const Text('Дата отсутствует')
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
                      if (state.room.depdate.isNotEmpty)
                        Text(
                          DateFormat.yMMMEd(
                              localizations.languageCode)
                              .format(DateTime.parse(
                              state.room.depdate)),
                        ),
                      if (state.room.depdate.isEmpty)
                        const Text('Дата отсутствует')
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
              title: Text(state.room.roomType),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.warning_rounded),
              title: Text(state.room.cleanStatusName),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading:
              const Icon(Icons.cleaning_services_rounded),
              title: Text(state.room.cleaningTypeName),
            ),
            const Divider(),
            const SizedBox(
              height: 16,
            ),
          ],
        );
      },
    );
  }
}
