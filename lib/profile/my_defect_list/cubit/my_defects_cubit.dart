import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/data/model/user.dart';
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

  Future<void> fetchMyDefects() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(fetchStatus: FetchStatus.success));
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }
}
