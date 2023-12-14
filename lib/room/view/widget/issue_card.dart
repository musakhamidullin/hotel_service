import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:intl/intl.dart';

import '../../../common/widgets/modals.dart';

import '../../../voice_messanger/cubit/voice_manager_cubit.dart';
import '../../../voice_messanger/view/message_audio_player.dart';
import '../../../voice_messanger/view/record_button.dart';
import '../../cubit/room_cubit.dart';
import '../../data/models/department_info.dart';

import '../room_page.dart';
import 'mini_images.dart';
import 'departments_list.dart';
import 'gallery_sheet.dart';
import 'issue_field.dart';

class IssueCard extends StatefulWidget {
  const IssueCard({
    super.key,
    required this.index,
    required this.dateTime,
    required this.text,
    required this.department,
    required this.isCreatedTab,
    required this.tabName,
  });

  final int index;
  final DateTime dateTime;
  final String text;
  final bool isCreatedTab;
  final Department department;
  final String tabName;

  @override
  State<IssueCard> createState() => _IssueCardState();
}

class _IssueCardState extends State<IssueCard> {
  final TextEditingController _controller = TextEditingController();
  late final _recordButtonId = '${widget.tabName}-${widget.index}';

  @override
  void initState() {
    super.initState();
    _controller.text = widget.text;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  ActionPane actionPane(int indexIssue, RoomCubit roomCubit) => ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            icon: Icons.delete,
            onPressed: (_) => roomCubit.onDeleteIssuePressed(indexIssue),
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.red,
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<RoomCubit>(context),
      child: Slidable(
        endActionPane: actionPane(widget.index, context.read<RoomCubit>()),
        startActionPane: actionPane(widget.index, context.read<RoomCubit>()),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        DateFormat()
                            .add_Hm()
                            .add_yMMMd()
                            .format(widget.dateTime),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    )
                  ],
                ),
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      Modals.showDraggableBottomSheet(
                        showDragHandle: true,
                        context,
                        DepartmentsList(
                          departments:
                              context.read<RoomCubit>().state.departments,
                          onDepartmentChanged: (department) => context
                              .read<RoomCubit>()
                              .onDepartmentChanged(widget.index, department),
                        ),
                      );
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    label: Text(widget.department.fullName.isEmpty
                        ? 'Выбрать службу'
                        : widget.department.fullName),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                RoomBuilder(
                  builder: (context, state) {
                    final images = widget.isCreatedTab
                        ? state.createdIssues[widget.index].images
                        : state.addedIssues[widget.index].images;
                    return images.isNotEmpty
                        ? MiniImagesIssueCard(
                            index: widget.index,
                            images: images,
                          )
                        : const SizedBox.shrink();
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                BlocBuilder<VoiceManagerCubit, VoiceManagerState>(
                  builder: (context, state) {
                    return Column(
                      children: state
                          .getRecordsByButtonId(_recordButtonId)
                          .map(
                            (e) => MessageAudioPlayer(
                                key: ObjectKey(e), voiceValue: e),
                          )
                          .toList(),
                    );
                  },
                ),
                IssueTextField(
                  textEditingController: _controller,
                  index: widget.index,
                  onTextChanged: (String text) => context
                      .read<RoomCubit>()
                      .onCommentChanged(widget.index, text),
                  onClearPressed: () => context
                      .read<RoomCubit>()
                      .onClearCommentPressed(widget.index),
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
                          isCreatedTab: widget.isCreatedTab,
                          indexIssue: widget.index,
                          roomCubit: context.read<RoomCubit>(),
                        ),
                      ),
                      icon: const Icon(Icons.attach_file_rounded),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    RecordButton(id: _recordButtonId),
                    const SizedBox(
                      width: 12,
                    ),
                    IconButton(
                      onPressed: () {
                        _controller.clear();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
