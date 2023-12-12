import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:intl/intl.dart';

import '../../../common/widgets/modals.dart';

import '../../cubit/room_cubit.dart';
import '../../data/models/department_info.dart';

import 'departments_list.dart';
import 'gallery_sheet.dart';
import 'issue_field.dart';

class IssueCard extends StatelessWidget {
  const IssueCard(
      {super.key,
      required this.index,
      required this.dateTime,
      required this.text,
      required this.department,
      required this.isCreatedTab});

  final int index;
  final DateTime dateTime;
  final String text;
  final bool isCreatedTab;

  final Department department;

  ActionPane actionPane(int indexIssue, RoomCubit roomCubit) =>
      ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          icon: Icons.delete,
          onPressed: (_) => roomCubit.onDeleteIssuePressed(indexIssue),
          borderRadius: BorderRadius.circular(10),
          backgroundColor: Colors.red,
        )
      ]);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider.value(
      value: BlocProvider.of<RoomCubit>(context),
      child: Slidable(
        endActionPane: actionPane(index, context.read<RoomCubit>()),
        startActionPane: actionPane(index, context.read<RoomCubit>()),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Text(
                        DateFormat('dd.MM.yyyy').format(dateTime),
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Text(
                        DateFormat('HH:mm').format(dateTime),
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => Modals.showBottomSheet(
                            context,
                            GalleryBottomSheet(
                              isCreatedTab: isCreatedTab,
                              indexIssue: index,
                              roomCubit: context.read<RoomCubit>(),
                            )),
                        icon: const Icon(Icons.attach_file_rounded)),
                    Flexible(
                        child: IssueTextField(
                            text: text,
                            index: index,
                            onTextChanged: (String text) => context
                                .read<RoomCubit>()
                                .onCommentChanged(index, text),
                            onClearPressed: () => context
                                .read<RoomCubit>()
                                .onClearCommentPressed(index))),
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                      onPressed: () {
                        Modals.showDraggableBottomSheet(
                            showDragHandle: true,
                            context,
                            DepartmentsList(
                              departments:
                                  context.read<RoomCubit>().state.departments,
                              onDepartmentChanged: (department) => context
                                  .read<RoomCubit>()
                                  .onDepartmentChanged(index, department),
                            ));
                      },
                      child: Text(department.fullName.isEmpty
                          ? 'Не выбрано'
                          : department.fullName))),
            ],
          ),
        ),
      ),
    );
  }
}
