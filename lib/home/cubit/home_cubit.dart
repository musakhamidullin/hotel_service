import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotel_service/auth/data/model/user.dart';
import 'package:hotel_service/home/data/repositories/hotel_rep.dart';

import '../data/models/room.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.user,
    required this.hotelRep,
  }) : super(const HomeState());

  final User user;
  final HotelRep hotelRep;

  Future<void> fetchHotel() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      final result = await hotelRep.fetchHotel();

      if (result.isEmpty) throw Exception();

      final rooms = <int, List<Room>>{};

      for (final e in result) {
        if (rooms.containsKey(e.floor)) {
          rooms[e.floor]!.add(e);
        } else {
          rooms[e.floor] = [e];
        }
      }

      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          rooms: rooms,
        ),
      );
    } catch (_) {
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }
}
