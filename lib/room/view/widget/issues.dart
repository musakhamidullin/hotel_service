import 'package:flutter/material.dart';

import '../../data/models/issues.dart';
import 'issue_card.dart';
import 'listview_builder.dart';

class IssuesList extends StatelessWidget {
  const IssuesList({super.key, required this.issues, required this.tabName});

  final List<IssuesModel> issues;
  final String tabName;

  @override
  Widget build(BuildContext context) {
    return ListViewBuilder<IssuesModel>(
      itemBuilder: (context, i) => IssueCard(
        index: i,
        tabName: tabName,
        issuesState: issues[i],
      ),
      items: issues,
    );
  }
}
