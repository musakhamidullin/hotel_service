import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/data/model/user.dart';
import '../../home/data/models/room.dart';

import '../data/models/department_info.dart';

import '../data/models/issue_report.dart';
import '../data/models/issues.dart';
import '../data/models/reports.dart';
import '../data/repositories/room_rep.dart';

part 'room_state.dart';
part 'room_cubit.freezed.dart';

// extension DeleteIssue on List<IssuesState> {
//   List<IssuesState> deleteIssue(List<IssuesState> issues, int i) {
//     final mutabledIssues = [...issues]..removeWhere((e) => e.index == i);

//     final List<IssuesState> updatedIssues = [];

//     for (var i = 0; i < mutabledIssues.length; i++) {
//       updatedIssues.add(mutabledIssues[i].copyWith(index: i));
//     }

//     return updatedIssues;
//   }
// }

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

      final issues = {
        1: room.defects
            .map((d) => IssuesState.filledByDefect(
                  d,
                ))
            .toList()
      };

      emit(state.copyWith(
        fetchStatus: FetchStatus.success,
        issues: issues,
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

  void onIssueStateChanged(IssuesState issuesState) {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    final mutabled = _mutabledIssues(issuesState);

    emit(state.copyWith(
        fetchStatus: FetchStatus.success, issues: {state.tabIndex: mutabled}));
  }

  void _mutableIssueState(IssuesState issuesState) {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    final mutabled = _mutabledIssues(issuesState);

    emit(state.copyWith(
        fetchStatus: FetchStatus.success, issues: {state.tabIndex: mutabled}));
  }

  List<IssuesState> _mutabledIssues(IssuesState issuesState) {
    final index = state.issues[state.tabIndex]!
        .indexWhere((e) => e.date == issuesState.date);

    final mutableList = [...state.issues[state.tabIndex]!];

    mutableList[index] = issuesState;

    return mutableList;
  }

  void onAddIssuePressed() {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    emit(state.copyWith(fetchStatus: FetchStatus.success, issues: {
      1: [...state.issues[state.tabIndex] ?? [], IssuesState.newIssue()]
    }));
  }

  void onDeleteIssuePressed(IssuesState issuesState) {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    emit(state.copyWith(fetchStatus: FetchStatus.success, issues: {
      state.tabIndex: [...state.issues[state.tabIndex]!]
        ..removeWhere((e) => e == issuesState)
    }));
  }

  void onClearImagesPressed(IssuesState issuesState) =>
      _mutableIssueState(issuesState);

  void onAddImagesPressed(int i, List<String> images) {}
  // => emit(state.tabIndex ==
  //         0
  //     ? state.copyWith(
  //         createdIssues: state.createdIssues
  //             .map((e) => e.index == i
  //                 ? e.copyWith(
  //                     images: <String>{
  //                     ...state.createdIssues[i].images,
  //                     ...images
  //                   }.toList())
  //                 : e)
  //             .toList())
  //     : state.copyWith(
  //         addedIssues: state.addedIssues
  //             .map((e) => e.index == i
  //                 ? e.copyWith(
  //                     images: [...state.addedIssues[i].images, ...images])
  //                 : e)
  //             .toList()));

  void onDeleteImagePressed(int i, String image) {}
  //  => emit(state.tabIndex == 0
  //     ? state.copyWith(
  //         fetchStatus: FetchStatus.success,
  //         createdIssues: [...state.createdIssues]
  //             .map((issue) => issue.index == i
  //                 ? issue.copyWith(
  //                     images: [...issue.images]..removeWhere((e) => e == image))
  //                 : issue)
  //             .toList())
  //     : state.copyWith(
  //         fetchStatus: FetchStatus.success,
  //         addedIssues: [...state.addedIssues]
  //             .map((issue) => issue.index == i
  //                 ? issue.copyWith(
  //                     images: [...issue.images]..removeWhere((e) => e == image))
  //                 : issue)
  //             .toList()));

  void onDepartmentChanged(int i, Department department) {}
  // => emit(state
  //             .tabIndex ==
  //         0
  //     ? state.copyWith(
  //         createdIssues: state.createdIssues
  //             .map((e) => e.index == i ? e.copyWith(department: department) : e)
  //             .toList())
  //     : state.copyWith(
  //         addedIssues: state.addedIssues
  //             .map((e) => e.index == i ? e.copyWith(department: department) : e)
  //             .toList()));

  void onCompletePressed() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      // final created =
      //     state.createdIssues.map((e) => ProblemList.fill(e)).toList();

      // final added = state.addedIssues.map((e) => ProblemList.fill(e)).toList();

      // final reports = Reports.fill(state, [...created, ...added]);

      // await _roomRep.sendReports(reports);

      emit(state.copyWith(fetchStatus: FetchStatus.success));
    } catch (e) {
      print(e);
    }
  }

  void onTabChanged(int i) => emit(state.copyWith(tabIndex: i));

  void onChangedImagesPressed(int i, List<String> images) {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    // emit(state.tabIndex == 0
    //     ? state.copyWith(
    //         fetchStatus: FetchStatus.success,
    //         createdIssues: [...state.createdIssues]
    //             .map((issue) =>
    //                 issue.index == i ? issue.copyWith(images: images) : issue)
    //             .toList())
    //     : state.copyWith(
    //         fetchStatus: FetchStatus.success,
    //         addedIssues: [...state.addedIssues]
    //             .map((issue) =>
    //                 issue.index == i ? issue.copyWith(images: images) : issue)
    //             .toList()));
  }
}
