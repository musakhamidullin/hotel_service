import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/room_cubit.dart';
import '../../data/models/issues.dart';
import '../room_page.dart';
import 'issue_card.dart';

class IssuesList extends StatelessWidget {
  const IssuesList({
    super.key,
    required this.issues,
    required this.tabName,
  });

  final List<IssuesModel> issues;
  final String tabName;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 100),
      itemCount: issues.length,
      shrinkWrap: true,
      itemBuilder: (context, i) => IssueCard(
        index: i,
        issue: issues[i],
        onSendPressed: () {
          final cubit = context.read<RoomCubit>();
          if (tabName.contains('Созданные')) {
            // cubit.onSendCreatedPressed(
            //   issues[i],
            // );

            return;
          }

          cubit.onSendNewPressed(
            issues[i],
            tabController: TabControllerScope.of(context),
          );
        },
      ),
    );
  }
}
