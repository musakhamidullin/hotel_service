import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/data/repositories/auth_rep.dart';
import '../cubit/home_cubit.dart';
import '../data/repositories/catalog_rep.dart';
import '../data/repositories/hotel_rep.dart';
import 'widgets/my_search_bar.dart';
import 'widgets/rooms_list.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _user = context.read<AuthRep>().user;
  late final _catalog = context.read<CatalogRep>();
  late final _homeCubit = HomeCubit(
    user: _user,
    hotelRep: HotelRep(),
    catalogRep: _catalog,
  );

  @override
  void dispose() {
    _homeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeCubit..fetchFirstHotelPage(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Номера'),
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (value) {
            if (value.metrics.pixels >= value.metrics.maxScrollExtent &&
                !value.metrics.outOfRange) {
              _homeCubit.fetchNewPage();
            }
            return true;
          },
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                const SliverAppBar(
                  titleSpacing: 8,
                  automaticallyImplyLeading: false,
                  floating: true,
                  title: MySearchBar(),
                ),
              ];
            },
            body: const RoomsList(),
          ),
        ),
      ),
    );
  }
}
