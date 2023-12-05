import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/room_cubit.dart';
import '../room_page.dart';
import 'issue_field.dart';

class IssueCard extends StatelessWidget {
  const IssueCard(
      {super.key,
      required this.index,
      required this.departments,
      required this.onAttachedFielPressed});

  final int index;
  final List<String> departments;
  final VoidCallback onAttachedFielPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: onAttachedFielPressed,
                    icon: const Icon(Icons.attach_file_rounded)),
                Flexible(child: RoomBuilder(
                  builder: (context, state) {
                    final text = state.issues[index].$3;
                    return IssueTextField(
                      text: text,
                      index: index,
                      onTextChanged: (String text) => context
                          .read<RoomCubit>()
                          .onCommentChanged(index, text),
                      onClearPressed: () => context
                          .read<RoomCubit>()
                          .onClearCommentPressed(index),
                    );
                  },
                )),
                // TODO если захотят добавить голосовой ввод
                // IconButton(
                //     onPressed: () {},
                //     icon: const Icon(Icons.mic))
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownMenu<String>(
              hintText: 'Выберите отдел',
              inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              menuStyle: MenuStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
              ),
              dropdownMenuEntries: departments
                  .map((e) => DropdownMenuEntry(value: e, label: e))
                  .toList())
        ],
      ),
    );
  }
}
