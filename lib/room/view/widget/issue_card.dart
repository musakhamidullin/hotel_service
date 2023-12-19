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

import '../../data/models/issues.dart';
import 'gallery/gallery_widget.dart';
import 'mini_images.dart';
import 'departments_list.dart';
import 'issue_field.dart';

class IssueCard extends StatefulWidget {
  const IssueCard({
    super.key,
    required this.index,
    required this.tabName,
    required this.issuesState,
  });

  final int index;
  final String tabName;
  final IssuesState issuesState;

  @override
  State<IssueCard> createState() => _IssueCardState();
}

class _IssueCardState extends State<IssueCard> {
  final TextEditingController _controller = TextEditingController();
  late final _recordButtonId = '${widget.tabName}-${widget.index}';
  var _readOnlyInput = false;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.issuesState.comment;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ActionPane actionPane(int indexIssue, RoomCubit roomCubit) => ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            icon: Icons.delete,
            onPressed: (_) =>
                roomCubit.onDeleteIssuePressed(widget.issuesState),
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.red,
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    final localizations = Localizations.localeOf(context);
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
                        DateFormat.yMMMEd(localizations.languageCode)
                            .add_Hm()
                            .format(DateTime.parse(widget.issuesState.date)),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context
                            .read<RoomCubit>()
                            .onDeleteIssuePressed(widget.issuesState);
                      },
                      icon: const Icon(Icons.delete),
                    )
                  ],
                ),
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      final cubit = context.read<RoomCubit>();
                      Modals.showBottomSheet(
                          showDragHandle: true,
                          context,
                          DraggableScrollableSheet(
                            expand: false,
                            initialChildSize: 0.4,
                            minChildSize: 0.2,
                            maxChildSize: 0.4,
                            builder: (context, scrollControl) => Column(
                              children: [
                                Expanded(
                                  child: DepartmentsList(
                                    scrollController: scrollControl,
                                    departments: cubit.state.departments,
                                    onDepartmentChanged: (department) =>
                                        cubit.onDepartmentChanged(
                                            widget.index, department),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: FilledButton.tonal(
                                      onPressed: Navigator.of(context).pop,
                                      child: const Text('Отмена'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    label: Text(widget.issuesState.department.fullName.isEmpty
                        ? 'Выбрать службу'
                        : widget.issuesState.department.fullName),
                  ),
                ),
                if (widget.issuesState.images.isNotEmpty)
                  Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      MiniImagesIssueCard(
                        index: widget.index,
                        images: widget.issuesState.images,
                        onChanged: (List<String> items) {
                          context
                              .read<RoomCubit>()
                              .onChangedImagesPressed(widget.index, items);
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
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
                if (widget.issuesState.images.isNotEmpty)
                  const SizedBox(height: 8),
                IssueTextField(
                  readOnly: _readOnlyInput,
                  textEditingController: _controller,
                  index: widget.index,
                  onTextChanged: (String text) => context
                      .read<RoomCubit>()
                      .onIssueStateChanged(
                          widget.issuesState.copyWith(comment: text)),
                  onClearPressed: () => context
                      .read<RoomCubit>()
                      .onIssueStateChanged(
                          widget.issuesState.copyWith(comment: '')),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        final cubit = context.read<RoomCubit>();
                        final images = <String>[];
                        // final images = widget.isCreatedTab
                        //     ? cubit.state.createdIssues[widget.index].images
                        //     : cubit.state.addedIssues[widget.index].images;
                        Modals.showBottomSheet(
                          context,
                          GalleryWidget(
                            onSavePressed: (List<String> items) =>
                                cubit.onAddImagesPressed(widget.index, items),
                            images: images,
                            onDeletePressed: (String item) =>
                                cubit.onDeleteImagePressed(widget.index, item),
                            onClearPressed: () => cubit.onIssueStateChanged(
                                widget.issuesState.copyWith(images: [])),
                          ),
                        );
                      },
                      icon: const Icon(Icons.attach_file_rounded),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    RecordButton(
                      id: _recordButtonId,
                      onRecord: (value) {
                        setState(() {
                          _readOnlyInput = value;
                        });
                      },
                    ),
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
