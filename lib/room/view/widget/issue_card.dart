import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:intl/intl.dart';

import '../../../common/widgets/modals.dart';

import '../../../voice_messanger/data/models/voice_value.dart';
import '../../../voice_messanger/view/message_audio_player.dart';
import '../../../voice_messanger/view/record_button.dart';
import '../../cubit/room_cubit.dart';

import '../../data/models/issues.dart';
import '../room_page.dart';
import 'comments/commnents_sheet.dart';
import 'gallery/gallery_widget.dart';
import 'mini_images.dart';
import 'departments_list.dart';
import 'issue_field.dart';

class IssueCard extends StatefulWidget {
  const IssueCard({
    super.key,
    required this.index,
    required this.issuesState,
  });

  final int index;
  final IssuesModel issuesState;

  @override
  State<IssueCard> createState() => _IssueCardState();
}

class _IssueCardState extends State<IssueCard> {
  final TextEditingController _controller = TextEditingController();
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
    final theme = Theme.of(context);
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
                  Expanded(
                    // TODO нужно получать номер заявки
                    child: Text(
                      widget.issuesState
                          .dateFormatted(localizations.languageCode),
                    ),
                  ),
                  const Text('№1337228')
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
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
                                            cubit.onIssueModelChanged(
                                                widget.issuesState.copyWith(
                                                    department: department))),
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
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.issuesState.department.fullName.isEmpty
                                  ? 'Выбрать отдел'
                                  : widget.issuesState.department.fullName,
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: theme.primaryColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: theme.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // TODO нужно получить статус заявки
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.green.withOpacity(0.5)),
                      child: const Text('Создано')),
                ],
              ),
              const SizedBox(
                height: 8,
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
                        playerKey:
                            '${widget.index}${widget.issuesState.audios.indexOf(e)}',
                        onRemove: (value) {
                          context.read<RoomCubit>().onAudioRemoved(
                              index: value, model: widget.issuesState);
                        },
                      ),
                    )
                    .toList(),
              ),
              if (widget.issuesState.images.isNotEmpty)
                const SizedBox(height: 8),
              Row(
                children: [
                  Flexible(
                    child: IssueTextField(
                      readOnly: _readOnlyInput,
                      textEditingController: _controller
                        ..text = widget.issuesState.comment,
                      onTextChanged: (String text) => context
                          .read<RoomCubit>()
                          .onIssueModelChanged(
                              widget.issuesState.copyWith(comment: text)),
                      onClearPressed: () => context
                          .read<RoomCubit>()
                          .onIssueModelChanged(
                              widget.issuesState.copyWith(comment: '')),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  IconButton(
                      onPressed: () => Modals.showBottomSheet(
                          context, const CommentsSheet()),
                      icon: const Icon(Icons.message))
                ],
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
                  if (widget.issuesState.isMutable)
                    IconButton(
                      onPressed: () => context
                          .read<RoomCubit>()
                          .onDeleteIssuePressed(widget.issuesState),
                      icon: const Icon(Icons.delete),
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
