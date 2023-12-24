import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:intl/intl.dart';

import '../../../common/widgets/modals.dart';

import '../../../voice_messanger/cubit/voice_manager_cubit.dart';
import '../../../voice_messanger/data/models/voice_value.dart';
import '../../../voice_messanger/view/message_audio_player.dart';
import '../../../voice_messanger/view/record_button.dart';
import '../../cubit/room_cubit.dart';

import '../../data/models/issues.dart';
import '../room_page.dart';
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
  final IssuesModel issuesState;

  @override
  State<IssueCard> createState() => _IssueCardState();
}

class _IssueCardState extends State<IssueCard> {
  final TextEditingController _controller = TextEditingController();
  late final _recordButtonId = '${widget.tabName}-${widget.index}';
  var _readOnlyInput = false;

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
    return Slidable(
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
                                    onDepartmentChanged: (department) => cubit
                                        .onIssueModelChanged(widget.issuesState
                                            .copyWith(department: department))),
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
                        context.read<RoomCubit>().onIssueModelChanged(
                            widget.issuesState.copyWith(images: items));
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              Column(
                children: widget.issuesState.audios
                    .map(
                      (e) => MessageAudioPlayer(
                        key: ObjectKey(e),
                        voiceValue: VoiceValue(base64: e),
                        index: widget.issuesState.audios.indexOf(e),
                        onRemove: (value) {
                          context.read<RoomCubit>().onAudioRemoved(index: value, model: widget.issuesState);
                        },
                      ),
                    )
                    .toList(),
              ),
              if (widget.issuesState.images.isNotEmpty)
                const SizedBox(height: 8),
              IssueTextField(
                readOnly: _readOnlyInput,
                textEditingController: _controller
                  ..text = widget.issuesState.comment,
                index: widget.index,
                onTextChanged: (String text) => context
                    .read<RoomCubit>()
                    .onIssueModelChanged(
                        widget.issuesState.copyWith(comment: text)),
                onClearPressed: () => context
                    .read<RoomCubit>()
                    .onIssueModelChanged(
                        widget.issuesState.copyWith(comment: '')),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (!_readOnlyInput)
                    Expanded(
                      child: FilledButton.tonal(
                        onPressed: () =>
                            context.read<RoomCubit>().onSendPressed(
                                  widget.issuesState,
                                  tabController: TabControllerScope.of(context),
                                ),
                        child: const Text('Отправить'),
                      ),
                    ),
                  const SizedBox(
                    width: 12,
                  ),
                  IconButton(
                    onPressed: () {
                      final cubit = context.read<RoomCubit>();
                      final images = cubit
                              .state
                              .issues[cubit.state.tabIndex]?[widget.index]
                              .images ??
                          [];

                      Modals.showBottomSheet(
                        context,
                        GalleryWidget(
                            onSavePressed: (List<String> items) =>
                                cubit.onIssueModelChanged(
                                    widget.issuesState.copyWith(images: items)),
                            images: images,
                            onDeletePressed: (String item) =>
                                cubit.onIssueModelChanged(
                                  widget.issuesState.copyWith(
                                      images: [...widget.issuesState.images]
                                        ..removeWhere((e) => e == item)),
                                ),
                            onClearPressed: () => cubit.onIssueModelChanged(
                                widget.issuesState.copyWith(images: []))),
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
                      setState(() => _readOnlyInput = value);
                    },
                    onStop: (value) {
                      context.read<RoomCubit>().onAudioRecorded(
                            base64: value,
                            model: widget.issuesState,
                          );
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  IconButton(
                    onPressed: _controller.clear,
                    icon: const Icon(Icons.close),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
