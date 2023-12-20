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

      final issues = {...state.issues};

      issues[0] = room.defects
          .map((d) => IssuesModel.filledByDefect(
                d,
              ))
          .toList();

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

    final map = {...state.issues};

    map[state.tabIndex] = mutabled;

    emit(state.copyWith(fetchStatus: FetchStatus.success, issues: map));
  }

  List<IssuesModel> _mutabledIssues(IssuesModel issuesState) {
    // TODO возможно, нужно искать по айди
    final index = state.issues[state.tabIndex]!
        .indexWhere((e) => e.date == issuesState.date);

    final mutableList = [...state.issues[state.tabIndex]!];

    mutableList[index] = issuesState;

    return mutableList;
  }

  void onAddIssuePressed() {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    late final Map<int, List<IssuesModel>> newMap;

    if (state.issues[1] == null) {
      newMap = {
        ...state.issues,
        ...{
          1: [IssuesModel.newIssue()]
        }
      };
    } else {
      newMap = {
        ...state.issues,
        ...{
          1: [...state.issues[1]!, IssuesModel.newIssue()]
        }
      };
    }

    emit(state.copyWith(fetchStatus: FetchStatus.success, issues: newMap));
  }

  void onDeleteIssuePressed(IssuesModel issuesState) {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    final map = {...state.issues};

    map[state.tabIndex] = [...state.issues[state.tabIndex]!]
      ..removeWhere((e) => e == issuesState);

    emit(state.copyWith(fetchStatus: FetchStatus.success, issues: map));
  }

  void onSendPressed(IssuesModel issuesModel) async {
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

      final updatedIssues = {...state.issues};

      updatedIssues[1]!.removeWhere((i) => i == issuesModel);

      emit(state.copyWith(
          fetchStatus: FetchStatus.success, issues: updatedIssues));

      await fetchRoom(state.room.roomId);
    } catch (e) {
      // emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }

  void onTabChanged(int i) => emit(state.copyWith(tabIndex: i));
}
