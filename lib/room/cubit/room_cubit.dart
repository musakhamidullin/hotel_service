import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'room_state.dart';
part 'room_cubit.freezed.dart';

extension AddImage on List<XFile> {
  List<XFile> addImage((int, XFile?) image, List<XFile> images) =>
      images..add(image.$2 ?? XFile(''));
}

extension DeleteImage on List<(int, List<XFile>, String)> {
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
  RoomCubit() : super(const RoomState());

  Future<void> fetchRoom(int id) async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(fetchStatus: FetchStatus.success));
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }

  Future<void> fetchDepartment() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(fetchStatus: FetchStatus.success, departments: [
        'Не выбрано',
        'Инженерно-техническая служба',
        'Служба энергетиков',
        'Вспомогательная хозяйственная служба'
      ]));
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }

  Future<void> onClearCommentPressed(int i) async => emit(state.copyWith(
      issues: state.issues
          .map((e) => (e.$1, e.$2, e.$1 == i ? '' : e.$3))
          .toList()));

  Future<void> onCommentChanged(int i, String text) async =>
      emit(state.copyWith(
          issues: state.issues
              .map((e) => (e.$1, e.$2, e.$1 == i ? text : e.$3))
              .toList()));

  Future<void> onAddIssuePressed() async => emit(state.copyWith(issues: [
        ...state.issues,
        (
          state.issues.isEmpty
              ? 0
              : state.issues.indexOf(state.issues.last) + 1,
          [],
          ''
        ),
      ]));

  Future<void> onDeleteIssuePressed(int i) async =>
      emit(state.copyWith(issues: state.issues.deleteIssue(state.issues, i)));

  Future<void> onFlushPressed(int i) async => emit(state.copyWith(
      issues: state.issues
          .map((e) => (e.$1, e.$1 == i ? <XFile>[] : e.$2, e.$3))
          .toList()));

  Future<void> onAddImageFromCameraPressed((int, XFile?) image) async =>
      emit(state.copyWith(
          issues: state.issues
              .map((e) => (
                    e.$1,
                    e.$1 == image.$1 ? e.$2.addImage(image, e.$2) : e.$2,
                    e.$3
                  ))
              .toList()));

  Future<void> onAddImagesPressed((int, List<XFile>) image) async =>
      emit(state.copyWith(
          issues: state.issues
              .map((e) => (
                    e.$1,
                    e.$1 == image.$1 ? <XFile>[...e.$2, ...image.$2] : e.$2,
                    e.$3
                  ))
              .toList()));

  Future<void> onDeleteImagePressed(
    XFile image,
  ) async =>
      emit(state.copyWith(
          issues: state.issues
              .map((e) => (e.$1, e.$2..removeWhere((i) => i == image), e.$3))
              .toList()));
}
