// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:hotel_service/app/router/router.dart' as _i4;
import 'package:hotel_service/auth/data/model/user.dart' as _i13;
import 'package:hotel_service/auth/view/login_page.dart' as _i5;
import 'package:hotel_service/auto_tabs/view/auto_tabs_page.dart' as _i1;
import 'package:hotel_service/home/data/models/room.dart' as _i12;
import 'package:hotel_service/home/view/home_page.dart' as _i3;
import 'package:hotel_service/profile/edit_user/view/edit_user_page.dart'
    as _i2;
import 'package:hotel_service/profile/my_schedule/view/my_schedule_page.dart'
    as _i6;
import 'package:hotel_service/profile/view/profile_page.dart' as _i7;
import 'package:hotel_service/room/view/room_page.dart' as _i8;
import 'package:hotel_service/statistics/view/statistics_page.dart' as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AutoTabRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AutoTabPage(),
      );
    },
    EditUserRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EditUserPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    HomeTab.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginPage(),
      );
    },
    MyScheduleRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MySchedulePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
    ProfileTab.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
      );
    },
    RoomRoute.name: (routeData) {
      final args = routeData.argsAs<RoomRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.RoomPage(
          key: args.key,
          room: args.room,
          user: args.user,
        ),
      );
    },
    StatisticsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.StatisticsPage(),
      );
    },
    StatisticsTab.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.StatisticsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AutoTabPage]
class AutoTabRoute extends _i10.PageRouteInfo<void> {
  const AutoTabRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AutoTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'AutoTabRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditUserPage]
class EditUserRoute extends _i10.PageRouteInfo<void> {
  const EditUserRoute({List<_i10.PageRouteInfo>? children})
      : super(
          EditUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditUserRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeTab extends _i10.PageRouteInfo<void> {
  const HomeTab({List<_i10.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          initialChildren: children,
        );

  static const String name = 'HomeTab';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MySchedulePage]
class MyScheduleRoute extends _i10.PageRouteInfo<void> {
  const MyScheduleRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MyScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyScheduleRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileTab extends _i10.PageRouteInfo<void> {
  const ProfileTab({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileTab.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTab';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RoomPage]
class RoomRoute extends _i10.PageRouteInfo<RoomRouteArgs> {
  RoomRoute({
    _i11.Key? key,
    required _i12.Room room,
    required _i13.User user,
    List<_i10.PageRouteInfo>? children,
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

  static const _i10.PageInfo<RoomRouteArgs> page =
      _i10.PageInfo<RoomRouteArgs>(name);
}

class RoomRouteArgs {
  const RoomRouteArgs({
    this.key,
    required this.room,
    required this.user,
  });

  final _i11.Key? key;

  final _i12.Room room;

  final _i13.User user;

  @override
  String toString() {
    return 'RoomRouteArgs{key: $key, room: $room, user: $user}';
  }
}

/// generated route for
/// [_i9.StatisticsPage]
class StatisticsRoute extends _i10.PageRouteInfo<void> {
  const StatisticsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          StatisticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.StatisticsScreen]
class StatisticsTab extends _i10.PageRouteInfo<void> {
  const StatisticsTab({List<_i10.PageRouteInfo>? children})
      : super(
          StatisticsTab.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsTab';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
