import 'package:flutter/material.dart';

import '../../data/models/issues.dart';
import 'issue_card.dart';
import 'listview_builder.dart';

class AddedIssuesList extends StatelessWidget {
  const AddedIssuesList({super.key, required this.addedIssues});

  final List<IssuesState> addedIssues;

  @override
  Widget build(BuildContext context) {
    return ListViewBuilder(
      items: addedIssues,
      itemBuilder: (context, i) => IssueCard(
        index: i,
        dateTime: DateTime.parse(addedIssues[i].date),
        text: addedIssues[i].comment,
        department: addedIssues[i].department,
        isCreatedTab: false,
        tabName: 'Новые',
        images: addedIssues[i].images,
      ),
    );
  }
}
