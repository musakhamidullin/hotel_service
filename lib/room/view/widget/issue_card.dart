import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:intl/intl.dart';

import '../../../common/widgets/modals.dart';

import '../../../voice_messanger/view/record_button.dart';
import '../../cubit/room_cubit.dart';
import '../../data/models/department_info.dart';

import 'departments_list.dart';
import 'gallery_sheet.dart';
import 'issue_field.dart';

class IssueCard extends StatelessWidget {
  const IssueCard({
    super.key,
    required this.index,
    required this.dateTime,
    required this.text,
    required this.department,
    required this.isCreatedTab,
  });

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
    return BlocProvider.value(
      value: BlocProvider.of<RoomCubit>(context),
      child: Slidable(
        endActionPane: actionPane(index, context.read<RoomCubit>()),
        startActionPane: actionPane(index, context.read<RoomCubit>()),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        DateFormat().add_Hm().add_yMMMd().format(dateTime),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    )
                  ],
                ),
                TextButton.icon(
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
                      ),
                    );
                  },
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  label: Text(department.fullName.isEmpty
                      ? 'Выбрать службу'
                      : department.fullName),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: IssueTextField(
                        text: text,
                        index: index,
                        onTextChanged: (String text) => context
                            .read<RoomCubit>()
                            .onCommentChanged(index, text),
                        onClearPressed: () => context
                            .read<RoomCubit>()
                            .onClearCommentPressed(index),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => Modals.showBottomSheet(
                              context,
                              GalleryBottomSheet(
                                isCreatedTab: isCreatedTab,
                                indexIssue: index,
                                roomCubit: context.read<RoomCubit>(),
                              )),
                          icon: const Icon(Icons.attach_file_rounded),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const RecordButton(id: '1'),
                        const SizedBox(
                          width: 12,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.send),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
