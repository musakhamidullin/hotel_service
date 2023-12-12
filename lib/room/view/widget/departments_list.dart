import 'package:flutter/material.dart';

import '../../data/models/department_info.dart';
import 'listview_builder.dart';

class DepartmentsList extends StatelessWidget {
  const DepartmentsList(
      {super.key,
      required this.departments,
      required this.onDepartmentChanged});

  final List<Department> departments;
  final void Function(Department department) onDepartmentChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListViewBuilder(
              items: departments,
              itemBuilder: (context, i) => ListTile(
                    onTap: () => onDepartmentChanged(departments[i]),
                    title: Text(departments[i].fullName),
                  )),
          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Отмена'))),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
