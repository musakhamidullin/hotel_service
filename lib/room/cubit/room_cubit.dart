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
        0: room.defects
            .map((d) => IssuesModel.filledByDefect(
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

  void onIssueModelChanged(IssuesModel issuesState) {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    final mutabled = _mutabledIssues(issuesState);

    emit(state.copyWith(
        fetchStatus: FetchStatus.success, issues: {state.tabIndex: mutabled}));
  }

  List<IssuesModel> _mutabledIssues(IssuesModel issuesState) {
    final index = state.issues[state.tabIndex]!
        .indexWhere((e) => e.date == issuesState.date);

    final mutableList = [...state.issues[state.tabIndex]!];

    mutableList[index] = issuesState;

    return mutableList;
  }

  void onAddIssuePressed() {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    emit(state.copyWith(fetchStatus: FetchStatus.success, issues: {
      1: [...state.issues[state.tabIndex] ?? [], IssuesModel.newIssue()]
    }));
  }

  void onDeleteIssuePressed(IssuesModel issuesState) {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    emit(state.copyWith(fetchStatus: FetchStatus.success, issues: {
      state.tabIndex: [...state.issues[state.tabIndex]!]
        ..removeWhere((e) => e == issuesState)
    }));
  }

  void onCompletePressed(IssuesModel issuesModel) async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      final tempIssues = <IssuesModel>[];

      for (var e in state.issues.values) {
        for (var i in e) {
          tempIssues.add(i);
        }
      }

      final issue = tempIssues.firstWhere((i) => i == issuesModel);

      final report = IssueReport.fill(state, issue);

      await _roomRep.sendReport(report);

      emit(state.copyWith(fetchStatus: FetchStatus.success));

      await fetchRoom(state.room.roomId);
    } catch (e) {
      // emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }

  void onTabChanged(int i) => emit(state.copyWith(tabIndex: i));
}
