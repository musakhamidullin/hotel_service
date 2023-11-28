// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:hotel_service/app/router/router.dart' as _i3;
import 'package:hotel_service/auth/view/login_page.dart' as _i4;
import 'package:hotel_service/auto_tabs/view/auto_tabs_page.dart' as _i1;
import 'package:hotel_service/home/data/models/room.dart' as _i10;
import 'package:hotel_service/home/view/home_page.dart' as _i2;
import 'package:hotel_service/profile/view/profile_page.dart' as _i5;
import 'package:hotel_service/room/view/room_page.dart' as _i6;
import 'package:hotel_service/statistics/view/statistics_page.dart' as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AutoTabRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AutoTabPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    HomeTab.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfilePage(),
      );
    },
    ProfileTab.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProfileScreen(),
      );
    },
    RoomRoute.name: (routeData) {
      final args = routeData.argsAs<RoomRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.RoomPage(
          key: args.key,
          room: args.room,
        ),
      );
    },
    StatisticsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.StatisticsPage(),
      );
    },
    StatisticsTab.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.StatisticsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AutoTabPage]
class AutoTabRoute extends _i8.PageRouteInfo<void> {
  const AutoTabRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AutoTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'AutoTabRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeTab extends _i8.PageRouteInfo<void> {
  const HomeTab({List<_i8.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          initialChildren: children,
        );

  static const String name = 'HomeTab';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ProfileScreen]
class ProfileTab extends _i8.PageRouteInfo<void> {
  const ProfileTab({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileTab.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTab';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RoomPage]
class RoomRoute extends _i8.PageRouteInfo<RoomRouteArgs> {
  RoomRoute({
    _i9.Key? key,
    required _i10.Room room,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          RoomRoute.name,
          args: RoomRouteArgs(
            key: key,
            room: room,
          ),
          initialChildren: children,
        );

  static const String name = 'RoomRoute';

  static const _i8.PageInfo<RoomRouteArgs> page =
      _i8.PageInfo<RoomRouteArgs>(name);
}

class RoomRouteArgs {
  const RoomRouteArgs({
    this.key,
    required this.room,
  });

  final _i9.Key? key;

  final _i10.Room room;

  @override
  String toString() {
    return 'RoomRouteArgs{key: $key, room: $room}';
  }
}

/// generated route for
/// [_i7.StatisticsPage]
class StatisticsRoute extends _i8.PageRouteInfo<void> {
  const StatisticsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          StatisticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.StatisticsScreen]
class StatisticsTab extends _i8.PageRouteInfo<void> {
  const StatisticsTab({List<_i8.PageRouteInfo>? children})
      : super(
          StatisticsTab.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsTab';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
