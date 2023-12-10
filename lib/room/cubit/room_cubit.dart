import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../home/data/models/room.dart';
import '../data/repositories/room_rep.dart';

part 'room_state.dart';
part 'room_cubit.freezed.dart';

extension AddImage on List<XFile> {
  List<XFile> addImage((int, XFile?) image, List<XFile> images) =>
      images..add(image.$2 ?? XFile(''));
}

extension DeleteIssue on List<(int, List<XFile>, String)> {
  List<(int, List<XFile>, String)> deleteIssue(
      List<(int, List<XFile>, String)> issues, int i) {
    final mutabledIssues = [...issues]..removeWhere((e) => e.$1 == i);

    final List<(int, List<XFile>, String)> updatedIssues = [];

    for (var i = 0; i < mutabledIssues.length; i++) {
      updatedIssues.add((i, mutabledIssues[i].$2, mutabledIssues[i].$3));
    }

    return updatedIssues;
  }
}

class RoomCubit extends Cubit<RoomState> {
  RoomCubit({required RoomRep roomRep})
      : _roomRep = roomRep,
        super(const RoomState());

  final RoomRep _roomRep;

  Future<void> fetchRoom(int id) async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      final room = await _roomRep.fetchRoom(id);

      int index = 0;

      final defects =
          room.defects.map((d) => (index++, <XFile>[], d.text)).toList();

      emit(state.copyWith(
        fetchStatus: FetchStatus.success,
        issues: defects,
        room: room,
      ));

      await fetchDepartment();
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }

  Future<void> fetchDepartment() async {
    emit(state.copyWith(fetchStatus: FetchStatus.success, departments: [
      'Не выбрано',
      'Инженерно-техническая служба',
      'Служба энергетиков',
      'Вспомогательная хозяйственная служба'
    ]));
  }

  void onClearCommentPressed(int i) => emit(state.copyWith(issues: [
        ...state.issues.map((e) => (e.$1, e.$2, e.$1 == i ? '' : e.$3)).toList()
      ]));

  void onCommentChanged(int i, String text) => emit(state.copyWith(issues: [
        ...state.issues
            .map((e) => (e.$1, e.$2, e.$1 == i ? text : e.$3))
            .toList()
      ]));

  void onAddIssuePressed() => emit(state.copyWith(issues: [
        ...state.issues,
        (
          state.issues.isEmpty
              ? 0
              : state.issues.indexOf(state.issues.last) + 1,
          [],
          ''
        ),
      ]));

  void onDeleteIssuePressed(int i) => emit(
      state.copyWith(issues: [...state.issues.deleteIssue(state.issues, i)]));

  void onFlushPressed(int i) => emit(state.copyWith(
      issues: state.issues
          .map((e) => (e.$1, e.$1 == i ? <XFile>[] : e.$2, e.$3))
          .toList()));

  void onAddImageFromCameraPressed((int, XFile?) image) {
    if (image.$2 == null) return;

    emit(state.copyWith(
        issues: state.issues
            .map((e) => (
                  e.$1,
                  e.$1 == image.$1 ? e.$2.addImage(image, e.$2) : e.$2,
                  e.$3
                ))
            .toList()));
  }

  void onAddImagesPressed((int, List<XFile>) image) => emit(state.copyWith(
      issues: state.issues
          .map((e) => (
                e.$1,
                e.$1 == image.$1 ? <XFile>[...e.$2, ...image.$2] : e.$2,
                e.$3
              ))
          .toList()));

  void onDeleteImagePressed(
    XFile image,
  ) =>
      emit(state.copyWith(
          issues: state.issues
              .map((e) => (e.$1, e.$2..removeWhere((i) => i == image), e.$3))
              .toList()));
}
