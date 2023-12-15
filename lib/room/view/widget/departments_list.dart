import 'package:flutter/material.dart';

import '../../data/models/department_info.dart';
import 'listview_builder.dart';

class DepartmentsList extends StatelessWidget {
  const DepartmentsList({
    super.key,
    required this.departments,
    required this.onDepartmentChanged,
    required this.scrollController,
  });

  final List<Department> departments;
  final void Function(Department department) onDepartmentChanged;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListViewBuilder(
      padding: EdgeInsets.zero,
      scrollController: scrollController,
      items: departments,
      itemBuilder: (context, i) => ListTile(
        onTap: () {
          onDepartmentChanged(departments[i]);
          Navigator.of(context).pop();
        },
        title: Text(departments[i].fullName),
      ),
    );
  }
}
