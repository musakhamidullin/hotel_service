import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app/router/router.gr.dart';
import 'widgets/bottom_nav_bar.dart';


@RoutePage()
class AutoTabPage extends StatefulWidget {
  const AutoTabPage({super.key});

  @override
  State<AutoTabPage> createState() => _AutoTabPageState();
}

class _AutoTabPageState extends State<AutoTabPage> {
  var _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeTab(),
        StatisticsTab(),
        ProfileTab()
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        final commentsRoute =
            context.router.topRoute.name == CommentsRoute.name;
        if (commentsRoute) {
          return const SizedBox.shrink();
        }
        return BottomNavBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            tabsRouter.setActiveIndex(index);

            if (_currIndex == index) {
              context.router.popTop();
            }

            _currIndex = index;
          },
        );
      },
    );
  }
}