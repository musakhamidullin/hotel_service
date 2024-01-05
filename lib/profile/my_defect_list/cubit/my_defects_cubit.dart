import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/data/model/user.dart';
import '../../../room/data/models/issues.dart';
import '../data/repository/my_defects_rep.dart';

part 'my_defects_state.dart';

part 'my_defects_cubit.freezed.dart';

class MyDefectsCubit extends Cubit<MyDefectsState> {
  MyDefectsCubit({
    required this.myDefectsRep,
    required this.user,
  }) : super(const MyDefectsState());

  final MyDefectsRep myDefectsRep;
  final User user;

  var _currPage = 1;

  Map<String, dynamic> _toPaginatingData() => {
        "Page": _currPage,
        "PageSize": 10,
        "PersonId": user.personInfo.id,
      };

  Future<void> fetchFirstPageMyDefects() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      _currPage = 1;

      final result = await myDefectsRep.fetchMyDefectList(
          _toPaginatingData(), user.personInfo.ownerId);
      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          myDefects: result,
        ),
      );
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }

  Future<void> fetchNewPage() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      _currPage++;

      final result = await myDefectsRep.fetchMyDefectList(
          _toPaginatingData(), user.personInfo.ownerId);

      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          myDefects: [
            ...state.myDefects,
            ...result,
          ],
        ),
      );
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }
}
