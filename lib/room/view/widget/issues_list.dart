import 'package:flutter/material.dart';

import '../../data/models/issues.dart';
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
      itemCount: issues.length,
      shrinkWrap: true,
      itemBuilder: (context, i) => IssueCard(
        index: i,
        tabName: tabName,
        issuesState: issues[i],
      ),
    );
  }
}
