import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_state.dart';
part 'room_cubit.freezed.dart';

class RoomCubit extends Cubit<RoomState> {
  RoomCubit() : super(const RoomState());

  Future<void> fetchRoom(int id) async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(fetchStatus: FetchStatus.success));
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }
}
