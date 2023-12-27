// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:hotel_service/app/router/router.dart' as _i4;
import 'package:hotel_service/auth/data/model/user.dart' as _i14;
import 'package:hotel_service/auth/view/login_page.dart' as _i5;
import 'package:hotel_service/auto_tabs/view/auto_tabs_page.dart' as _i1;
import 'package:hotel_service/home/data/models/room.dart' as _i13;
import 'package:hotel_service/home/view/home_page.dart' as _i3;
import 'package:hotel_service/profile/edit_user/view/edit_user_page.dart'
    as _i2;
import 'package:hotel_service/profile/my_defect_list/view/my_defect_list_page.dart'
    as _i6;
import 'package:hotel_service/profile/my_schedule/view/my_schedule_page.dart'
    as _i7;
import 'package:hotel_service/profile/view/profile_page.dart' as _i8;
import 'package:hotel_service/room/view/room_page.dart' as _i9;
import 'package:hotel_service/statistics/view/statistics_page.dart' as _i10;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AutoTabRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AutoTabPage(),
      );
    },
    EditUserRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EditUserPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    HomeTab.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginPage(),
      );
    },
    MyDefectListRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MyDefectListPage(),
      );
    },
    MyScheduleRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MySchedulePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfilePage(),
      );
    },
    ProfileTab.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
      );
    },
    RoomRoute.name: (routeData) {
      final args = routeData.argsAs<RoomRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.RoomPage(
          key: args.key,
          room: args.room,
          user: args.user,
        ),
      );
    },
    StatisticsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.StatisticsPage(),
      );
    },
    StatisticsTab.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.StatisticsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AutoTabPage]
class AutoTabRoute extends _i11.PageRouteInfo<void> {
  const AutoTabRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AutoTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'AutoTabRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditUserPage]
class EditUserRoute extends _i11.PageRouteInfo<void> {
  const EditUserRoute({List<_i11.PageRouteInfo>? children})
      : super(
          EditUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditUserRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeTab extends _i11.PageRouteInfo<void> {
  const HomeTab({List<_i11.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          initialChildren: children,
        );

  static const String name = 'HomeTab';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MyDefectListPage]
class MyDefectListRoute extends _i11.PageRouteInfo<void> {
  const MyDefectListRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MyDefectListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyDefectListRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MySchedulePage]
class MyScheduleRoute extends _i11.PageRouteInfo<void> {
  const MyScheduleRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MyScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyScheduleRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileTab extends _i11.PageRouteInfo<void> {
  const ProfileTab({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileTab.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTab';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.RoomPage]
class RoomRoute extends _i11.PageRouteInfo<RoomRouteArgs> {
  RoomRoute({
    _i12.Key? key,
    required _i13.Room room,
    required _i14.User user,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RoomRoute.name,
          args: RoomRouteArgs(
            key: key,
            room: room,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'RoomRoute';

  static const _i11.PageInfo<RoomRouteArgs> page =
      _i11.PageInfo<RoomRouteArgs>(name);
}

class RoomRouteArgs {
  const RoomRouteArgs({
    this.key,
    required this.room,
    required this.user,
  });

  final _i12.Key? key;

  final _i13.Room room;

  final _i14.User user;

  @override
  String toString() {
    return 'RoomRouteArgs{key: $key, room: $room, user: $user}';
  }
}

/// generated route for
/// [_i10.StatisticsPage]
class StatisticsRoute extends _i11.PageRouteInfo<void> {
  const StatisticsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          StatisticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.StatisticsScreen]
class StatisticsTab extends _i11.PageRouteInfo<void> {
  const StatisticsTab({List<_i11.PageRouteInfo>? children})
      : super(
          StatisticsTab.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsTab';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
