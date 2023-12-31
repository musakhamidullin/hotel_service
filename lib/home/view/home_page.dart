import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_service/auth/data/repositories/auth_rep.dart';
import 'package:hotel_service/home/cubit/home_cubit.dart';
import 'package:hotel_service/home/data/repositories/hotel_rep.dart';
import 'package:hotel_service/home/view/widgets/rooms_list.dart';

import 'widgets/my_search_bar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _user = context.read<AuthRep>().user;
  late final _homeCubit = HomeCubit(
    user: _user,
    hotelRep: HotelRep(),
  );

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadNewPage);
  }

  @override
  void dispose() {
    _homeCubit.close();
    _scrollController.removeListener(_loadNewPage);
    _scrollController.dispose();
    super.dispose();
  }

  void _loadNewPage() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      print('new page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeCubit..fetchHotel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Номера'),
        ),
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                titleSpacing: 8,
                automaticallyImplyLeading: false,
                floating: true,
                title: MySearchBar(),
              ),
            ];
          },
          body: RoomsList(
            scrollController: _scrollController,
          ),
        ),
      ),
    );
  }
}
