import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/data/model/user.dart';
import '../data/models/room.dart';
import '../data/repositories/catalog_rep.dart';
import '../data/repositories/hotel_rep.dart';

part 'home_cubit.freezed.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.user,
    required this.hotelRep,
    required this.catalogRep,
  }) : super(const HomeState());

  final User user;
  final HotelRep hotelRep;
  final CatalogRep catalogRep;

  Future<void> fetchFirstHotelPage() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      await catalogRep.fetchCleanStatuses();
      await catalogRep.fetchCleanTypes(user.personInfo.ownerId);

      final result = await hotelRep.fetchHotel();

      if (result.isEmpty) throw Exception();

      final rooms = <String, List<Room>>{};

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
    } catch (e, t) {
      print(e);
      print(t);
      emit(state.copyWith(fetchStatus: FetchStatus.failure));
    }
  }
}
