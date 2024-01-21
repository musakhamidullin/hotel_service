import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/data/model/user.dart';
import '../../home/data/models/room.dart';

import '../data/models/audio.dart';
import '../data/models/defect_status.dart';
import '../data/models/department_info.dart';

import '../data/models/issue_created_report.dart';
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

  Future<void> fetchRoom(int id, {bool refresh = false}) async {
    if (isClosed) return;
    try {
      emit(state.copyWith(
          fetchStatus: refresh ? FetchStatus.refreshing : FetchStatus.loading));

      final room = await _roomRep.fetchRoom(id);

      final issues = {...state.issues};

      final departments = await _fetchDepartment();
      final defectStatuses = await _fetchDefectStatus();

      issues[0] = room.defects
          .map(
              (d) => IssuesModel.filledByDefect(d, departments, defectStatuses))
          .toList();

      emit(
        state.copyWith(
          departments: departments,
          fetchStatus: FetchStatus.success,
          issues: issues,
          room: room,
        ),
      );
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }

  Future<List<Department>> _fetchDepartment() async {
    try {
      final ownerId = state.user.personInfo.ownerId;

      final departments = await _roomRep.fetchDepartment(ownerId);

      return [
        Department.defaultDepartment(),
        ...departments,
      ];
    } catch (_) {
      return [];
    }
  }

  Future<List<DefectStatus>> _fetchDefectStatus() async {
    try {
      final ownerId = state.user.personInfo.ownerId;

      return await _roomRep.fetchDefectStatus(ownerId);
    } catch (_) {
      return [];
    }
  }

  void onIssueModelChanged(IssuesModel issuesState) {
    emit(state.copyWith(fetchStatus: FetchStatus.init));
    final updatedIssueModel = _updateIssueModel(issuesState);

    final map = {...state.issues};

    map[state.tabIndex] = updatedIssueModel;

    emit(state.copyWith(fetchStatus: FetchStatus.success, issues: map));
  }

  Future<void> onAudioRecorded(
      {required String base64, required IssuesModel model}) async {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    final updatedIssueModel = _updateIssueModel(
      model.copyWith(
        audios: [
          AudioModel.fromDevice(base64),
          ...model.audios,
        ],
      ),
    );

    //todo дупликад кода
    final map = {...state.issues};

    map[state.tabIndex] = updatedIssueModel;

    emit(
      state.copyWith(
        fetchStatus: FetchStatus.success,
        issues: map,
      ),
    );
  }

  Future<void> onAudioRemoved(
      {required int index, required IssuesModel model}) async {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    final updatedIssueModel = _updateIssueModel(
      model.copyWith(
        audios: [...model.audios]..removeAt(index),
      ),
    );

    //todo дупликад кода
    final map = {...state.issues};

    map[state.tabIndex] = updatedIssueModel;

    emit(
      state.copyWith(
        fetchStatus: FetchStatus.success,
        issues: map,
      ),
    );
  }

  List<IssuesModel> _updateIssueModel(IssuesModel issuesState) {
    // TODO возможно, нужно искать по айди
    final index = state.issues[state.tabIndex]!
        .indexWhere((e) => e.date == issuesState.date);

    final mutableList = [...state.issues[state.tabIndex]!];

    mutableList[index] = issuesState;

    return mutableList;
  }

  void onAddIssuePressed() {
    emit(state.copyWith(fetchStatus: FetchStatus.init));
    emit(
      state.copyWith(
        fetchStatus: FetchStatus.success,
        issues: {
          ...state.issues,
          ...{
            1: [
              IssuesModel.newIssue(state.user),
              ...?state.issues[1],
            ]
          }
        },
      ),
    );
  }

  void onDeleteIssuePressed(IssuesModel issuesState) {
    emit(state.copyWith(fetchStatus: FetchStatus.init));

    final map = {...state.issues};

    map[state.tabIndex] = [...state.issues[state.tabIndex]!]
      ..removeWhere((e) => e == issuesState);

    emit(state.copyWith(fetchStatus: FetchStatus.success, issues: map));
  }

  void onSendNewPressed(IssuesModel issuesModel,
      {TabController? tabController}) async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.refreshing));

      //todo как менять уже созданные?
      final issue = state.issues[1]?.firstWhere((i) => i == issuesModel);

      if (issue == null) return;

      final report = IssueReport.fill(state, issue);

      //todo тут мы должны получать обновленную заявку
      await _roomRep.sendReport(report);

      final updatedIssues = {...state.issues};

      updatedIssues[1]!.removeWhere((i) => i == issuesModel);

      emit(state.copyWith(
          fetchStatus: FetchStatus.sendSuccess, issues: updatedIssues));

      if (tabController?.index != 0) tabController?.animateTo(0);
      // пока нужен т к .sendReport(report) ничего не возвращает
      await fetchRoom(state.room.roomId, refresh: true);
    } catch (e) {
      print(e);
      emit(state.copyWith(fetchStatus: FetchStatus.sendError));
    }
  }

  void onSendCreatedPressed(
    IssuesModel issuesModel,
  ) async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.refreshing));

      //todo как менять уже созданные?
      final issue = state.issues[0]?.firstWhere((i) => i == issuesModel);

      if (issue == null) return;

      final report = IssueCreatedReport.fill(state, issue);

      //todo тут мы должны получать обновленную заявку
      await _roomRep.sendCreatedReport(report);

      // emit(state.copyWith(fetchStatus: FetchStatus.sendSuccess));
      // пока нужен т к .sendReport(report) ничего не возвращает
      await fetchRoom(state.room.roomId, refresh: true);
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.sendError));
    }
  }

  void onTabChanged(int i) => emit(state.copyWith(tabIndex: i));
}
