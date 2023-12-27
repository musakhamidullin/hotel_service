import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: LoginRoute.page),
    AutoRoute(
      page: AutoTabRoute.page,
      path: '/',
      children: [
        AutoRoute(
          page: HomeTab.page,
          path: '',
          children: [
            AutoRoute(
              path: '',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: '',
              page: RoomRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: StatisticsTab.page,
          path: '',
          children: [
            AutoRoute(
              path: '',
              page: StatisticsRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: ProfileTab.page,
          path: '',
          children: [
            AutoRoute(
              path: '',
              page: ProfileRoute.page,
            ),
            AutoRoute(
              path: '',
              page: EditUserRoute.page,
            ),
            AutoRoute(
              path: '',
              page: MyScheduleRoute.page,
            ),
            AutoRoute(
              path: '',
              page: MyDefectListRoute.page,
            ),
          ],
        ),
      ],
    ),
  ];
}

@RoutePage(name: 'HomeTab')
class HomeScreen extends AutoRouter {
  const HomeScreen({super.key});
}

@RoutePage(name: 'StatisticsTab')
class StatisticsScreen extends AutoRouter {
  const StatisticsScreen({super.key});
}

@RoutePage(name: 'ProfileTab')
class ProfileScreen extends AutoRouter {
  const ProfileScreen({super.key});
}
