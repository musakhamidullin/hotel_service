import 'package:flutter/material.dart';

import '../../data/models/issues.dart';
import 'issue_card.dart';

class AddedIssuesList extends StatelessWidget {
  const AddedIssuesList({super.key, required this.addedIssues});
  final List<IssuesState> addedIssues;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemCount: addedIssues.length,
        shrinkWrap: true,
        itemBuilder: (_, issueIndex) {
          return IssueCard(
            index: issueIndex,
            dateTime: DateTime.parse(addedIssues[issueIndex].date),
            text: addedIssues[issueIndex].comment,
            department: addedIssues[issueIndex].department,
            isCreatedTab: false,
          );
        });
  }
}
