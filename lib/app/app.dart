import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/cubit/auth_cubit.dart';
import '../auth/data/repositories/auth_rep.dart';
import '../auth/data/repositories/user_rep.dart';
import 'router/router.dart';
import 'router/router.gr.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  final _authCubit = AuthCubit(
    authRep: AuthRep.current,
    userRep: UserRep(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _authCubit,
      child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser:
              _appRouter.defaultRouteParser(includePrefixMatches: true),
          routerDelegate: AutoRouterDelegate.declarative(
            _appRouter,
            routes: (_) =>
                [if (state.logged()) const HomeRoute() else const LoginRoute()],
          ),
          builder: (context, child) {
            return child!;
          },
        );
      }),
    );
  }
}
