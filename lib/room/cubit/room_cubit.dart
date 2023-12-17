import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/data/model/user.dart';
import '../../home/data/models/room.dart';

import '../data/models/department_info.dart';

import '../data/models/issue_report.dart';
import '../data/models/issues.dart';
import '../data/repositories/room_rep.dart';

part 'room_state.dart';
part 'room_cubit.freezed.dart';

extension DeleteIssue on List<IssuesState> {
  List<IssuesState> deleteIssue(List<IssuesState> issues, int i) {
    final mutabledIssues = [...issues]..removeWhere((e) => e.index == i);

    final List<IssuesState> updatedIssues = [];

    for (var i = 0; i < mutabledIssues.length; i++) {
      updatedIssues.add(mutabledIssues[i].copyWith(index: i));
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
  RoomCubit({required RoomRep roomRep, required User user})
      : _roomRep = roomRep,
        super(RoomState(user: user));

  final RoomRep _roomRep;

  Future<void> fetchRoom(int id) async {
    if (isClosed) return;
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      final room = await _roomRep.fetchRoom(id);

      final defects = room.defects
          .mapIndexed((d, i) => IssuesState.filledByDefect(
                d,
                i,
              ))
          .toList();

      emit(state.copyWith(
        fetchStatus: FetchStatus.success,
        createdIssues: defects,
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

  void onClearCommentPressed(int i) => state.tabIndex == 0
      ? emit(state.copyWith(createdIssues: [
          ...state.createdIssues
              .map((e) => e.index == i ? e.copyWith(comment: '') : e)
              .toList()
        ]))
      : emit(state.copyWith(addedIssues: [
          ...state.addedIssues
              .map((e) => e.index == i ? e.copyWith(comment: '') : e)
              .toList()
        ]));

  void onCommentChanged(int i, String text) => state.tabIndex == 0
      ? emit(state.copyWith(createdIssues: [
          ...state.createdIssues
              .map((e) => e.index == i ? e.copyWith(comment: text) : e)
              .toList()
        ]))
      : emit(state.copyWith(addedIssues: [
          ...state.addedIssues
              .map((e) => e.index == i ? e.copyWith(comment: text) : e)
              .toList()
        ]));

  void onAddIssuePressed() {
    int index = 0;

    index = state.addedIssues.isEmpty
        ? 0
        : index = state.addedIssues.lastIndexOf(state.addedIssues.last) + 1;

    emit(state.copyWith(addedIssues: [
      ...state.addedIssues,
      IssuesState.newIssue(
        state.addedIssues.isEmpty ? 0 : index,
      )
    ]));
  }

  void onDeleteIssuePressed(int i) => state.tabIndex == 0
      ? emit(state.copyWith(createdIssues: [
          ...state.createdIssues.deleteIssue(state.createdIssues, i)
        ]))
      : emit(state.copyWith(addedIssues: [
          ...state.addedIssues.deleteIssue(state.addedIssues, i)
        ]));

  void onFlushPressed(int i) => state.tabIndex == 0
      ? emit(state.copyWith(
          createdIssues: state.createdIssues
              .map((e) => e.index == i ? e.copyWith(images: []) : e)
              .toList()))
      : emit(state.copyWith(
          addedIssues: state.addedIssues
              .map((e) => e.index == i ? e.copyWith(images: []) : e)
              .toList()));

  void onAddImagesPressed(int i, List<String> images) =>
      emit(state.tabIndex == 0
          ? state.copyWith(
              createdIssues: state.createdIssues
                  .map((e) => e.index == i
                      ? e.copyWith(
                          images: [...state.createdIssues[i].images, ...images])
                      : e)
                  .toList())
          : state.copyWith(
              addedIssues: state.addedIssues
                  .map((e) => e.index == i
                      ? e.copyWith(
                          images: [...state.addedIssues[i].images, ...images])
                      : e)
                  .toList()));

  void onDeleteImagePressed(int i, String image) => state.tabIndex == 0
      ? emit(state.copyWith(
          createdIssues: [...state.createdIssues]
              .map((issue) => issue.index == i
                  ? issue.copyWith(
                      images: [...issue.images]..removeWhere((e) => e == image))
                  : issue)
              .toList()))
      : emit(state.copyWith(
          addedIssues: [...state.addedIssues]
              .map((issue) => issue.index == i
                  ? issue.copyWith(
                      images: [...issue.images]..removeWhere((e) => e == image))
                  : issue)
              .toList()));

  void onDepartmentChanged(int i, Department department) => state.tabIndex == 0
      ? emit(state.copyWith(
          createdIssues: state.createdIssues
              .map((e) => e.index == i ? e.copyWith(department: department) : e)
              .toList()))
      : emit(state.copyWith(
          addedIssues: state.addedIssues
              .map((e) => e.index == i ? e.copyWith(department: department) : e)
              .toList()));

  void onCompletePressed() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      final report = state.createdIssues
          .map(
              (issueState) => IssueReport.filledByIssueState(state, issueState))
          .toList()
          .last;

      // await _roomRep.sendReports(report);

      emit(state.copyWith(fetchStatus: FetchStatus.success));
    } catch (e) {
      print(e);
    }
  }

  void onTabChanged(int i) => emit(state.copyWith(tabIndex: i));
}
