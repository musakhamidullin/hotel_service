import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: HomeBranch.page, children: [
      AutoRoute(page: HomeRoute.page),
      AutoRoute(page: RoomRoute.page),
    ]),
  ];
}

@RoutePage(name: 'HomeBranch')
class HomeWrapper extends AutoRouter {
  const HomeWrapper({super.key});
}
