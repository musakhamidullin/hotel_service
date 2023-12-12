import 'package:flutter/material.dart';

import '../../data/models/issues.dart';
import 'issue_card.dart';

class CreatedIssuesList extends StatelessWidget {
  const CreatedIssuesList({super.key, required this.createdIssues});

  final List<IssuesState> createdIssues;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemCount: createdIssues.length,
        shrinkWrap: true,
        itemBuilder: (_, issueIndex) {
          return IssueCard(
            index: issueIndex,
            dateTime: DateTime.parse(createdIssues[issueIndex].date),
            text: createdIssues[issueIndex].comment,
            department: createdIssues[issueIndex].department,
            isCreatedTab: true,
          );
        });
  }
}
