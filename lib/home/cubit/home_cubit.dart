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

  var _currPage = 1;
  var _pages = 0;

  Future<void> fetchFirstHotelPage() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      await catalogRep.fetchCleanStatuses();
      await catalogRep.fetchCleanTypes(user.personInfo.ownerId);

      final (List<Room> data, int pages) = await hotelRep.fetchHotel(
        page: _currPage,
        ownerId: user.personInfo.ownerId,
      );

      _pages = pages;
      final rooms = <String, List<Room>>{};

      for (final e in data) {
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

  Future<void> fetchNewPage() async {
    try {
      if (_currPage >= _pages) return;
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      _currPage++;

      final (List<Room> data, _) = await hotelRep.fetchHotel(
        page: _currPage,
        ownerId: user.personInfo.ownerId,
      );

      final rooms = <String, List<Room>>{...state.rooms};

      for (final e in data) {
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
