import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../auth/data/model/user.dart';
import '../../home/data/models/room.dart';

import '../data/models/department_info.dart';
import '../data/models/issue_report.dart';
import '../data/repositories/room_rep.dart';

part 'room_state.dart';
part 'room_cubit.freezed.dart';

extension AddImage on List<XFile> {
  List<XFile> addImage(
    (int, XFile?) image,
    List<XFile> images,
  ) =>
      images..add(image.$2 ?? XFile(''));
}

extension DeleteIssue
    on List<(int, List<XFile>, String, DateTime, bool isMutable, Department)> {
  List<(int, List<XFile>, String, DateTime, bool isMutable, Department)>
      deleteIssue(
          List<(int, List<XFile>, String, DateTime, bool isMutable, Department)>
              issues,
          int i) {
    final mutabledIssues = [...issues]..removeWhere((e) => e.$1 == i);

    final List<(int, List<XFile>, String, DateTime, bool isMutable, Department)>
        updatedIssues = [];

    for (var i = 0; i < mutabledIssues.length; i++) {
      updatedIssues.add((
        i,
        mutabledIssues[i].$2,
        mutabledIssues[i].$3,
        mutabledIssues[i].$4,
        mutabledIssues[i].$5,
        mutabledIssues[i].$6,
      ));
    }

    return updatedIssues;
  }
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

class RoomCubit extends Cubit<RoomState> {
  RoomCubit({required RoomRep roomRep})
      : _roomRep = roomRep,
        super(const RoomState());

  final RoomRep _roomRep;

  Future<void> fetchRoom(int id) async {
    if (isClosed) return;
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      final room = await _roomRep.fetchRoom(id);

      final defects = room.defects
          .mapIndexed((d, i) =>
              (i++, <XFile>[], d.text, d.createDate, false, const Department()))
          .toList();

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
    final ownerId = state.user.personInfo.ownerId;

    final departments = await _roomRep.fetchDepartment(ownerId);

    emit(state.copyWith(departments: [
      const Department(fullName: 'Не выбрано'),
      ...departments
    ]));
  }

  void onClearCommentPressed(int i) => emit(state.copyWith(issues: [
        ...state.issues
            .map((e) => (e.$1, e.$2, e.$1 == i ? '' : e.$3, e.$4, e.$5, e.$6))
            .toList()
      ]));

  void onCommentChanged(int i, String text) => emit(state.copyWith(issues: [
        ...state.issues
            .map((e) => (e.$1, e.$2, e.$1 == i ? text : e.$3, e.$4, e.$5, e.$6))
            .toList()
      ]));

  void onAddIssuePressed() => emit(state.copyWith(issues: [
        ...state.issues,
        (
          state.issues.isEmpty ? 0 : state.issues.length - 1,
          [],
          '',
          DateTime.now(),
          true,
          const Department()
        ),
      ]));

  void onDeleteIssuePressed(int i) => emit(
      state.copyWith(issues: [...state.issues.deleteIssue(state.issues, i)]));

  void onFlushPressed(int i) => emit(state.copyWith(
      issues: state.issues
          .map((e) =>
              (e.$1, e.$1 == i ? <XFile>[] : e.$2, e.$3, e.$4, e.$5, e.$6))
          .toList()));

  void onAddImageFromCameraPressed((int, XFile?) image) {
    if (image.$2 == null) return;

    emit(state.copyWith(
        issues: state.issues
            .map((e) => (
                  e.$1,
                  e.$1 == image.$1 ? e.$2.addImage(image, e.$2) : e.$2,
                  e.$3,
                  e.$4,
                  e.$5,
                  e.$6
                ))
            .toList()));
  }

  void onAddImagesPressed((int, List<XFile>) image) => emit(state.copyWith(
      issues: state.issues
          .map((e) => (
                e.$1,
                e.$1 == image.$1 ? <XFile>[...e.$2, ...image.$2] : e.$2,
                e.$3,
                e.$4,
                e.$5,
                e.$6
              ))
          .toList()));

  void onDeleteImagePressed(
    XFile image,
  ) =>
      emit(state.copyWith(
          issues: state.issues
              .map((e) => (
                    e.$1,
                    e.$2..removeWhere((i) => i == image),
                    e.$3,
                    e.$4,
                    e.$5,
                    e.$6
                  ))
              .toList()));

  void onOwnerIdChanged(User user) => emit(state.copyWith(user: user));

  void onDepartmentChanged((int, Department) department) => emit(state.copyWith(
      issues: state.issues
          .map((e) => (
                e.$1,
                e.$2,
                e.$3,
                e.$4,
                e.$5,
                e.$1 == department.$1 ? department.$2 : e.$6
              ))
          .toList()));

  void onCompletePressed() async {
    emit(state.copyWith(fetchStatus: FetchStatus.loading));

    final report = state.issues
        .map((e) => IssueReport(
            personId: state.user.personInfo.id,
            problemMedia: e.$2.map((e) {
              final file = File(e.path);

              final bytes = file.readAsBytesSync();

              final media64Base = base64UrlEncode(bytes);

              return ProblemMedia(
                  mediaBase64: media64Base, mediaType: extension(e.path));
            }).toList(),
            problemText: e.$3,
            roomId: state.room.roomId))
        .last;

    await _roomRep.sendReports(report);

    emit(state.copyWith(fetchStatus: FetchStatus.success));
  }
}
