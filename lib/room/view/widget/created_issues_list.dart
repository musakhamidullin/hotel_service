import 'package:flutter/material.dart';

import '../../data/models/issues.dart';
import 'issue_card.dart';
import 'listview_builder.dart';

class CreatedIssuesList extends StatelessWidget {
  const CreatedIssuesList({super.key, required this.createdIssues});

  final List<IssuesState> createdIssues;

  @override
  Widget build(BuildContext context) {
    return ListViewBuilder<IssuesState>(
      itemBuilder: (context, i) => IssueCard(
        index: i,
        dateTime: DateTime.parse(createdIssues[i].date),
        text: createdIssues[i].comment,
        department: createdIssues[i].department,
        isCreatedTab: true,
      ),
      items: createdIssues,
    );
  }
}
