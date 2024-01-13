import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:permission_handler/permission_handler.dart';

import '../auth/cubit/auth_cubit.dart';
import '../auth/data/repositories/auth_rep.dart';
import '../home/data/repositories/catalog_rep.dart';
import 'router/router.dart';
import 'router/router.gr.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  final _authRep = AuthRep();
  final _catalogRep = CatalogRep();
  late final _authCubit = AuthCubit(authRep: _authRep);

  @override
  void initState() {
    super.initState();
    getPermissions();
  }

  Future<void> getPermissions() async {
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => _authRep,
        ),
        RepositoryProvider(
          create: (_) => _catalogRep,
        ),
      ],
      child: BlocProvider(
        create: (_) => _authCubit,
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routeInformationParser:
                  _appRouter.defaultRouteParser(includePrefixMatches: true),
              routerDelegate: AutoRouterDelegate.declarative(
                _appRouter,
                routes: (_) => [
                  if (state.logged())
                    const AutoTabRoute()
                  else
                    const LoginRoute()
                ],
              ),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ru'),
              ],
              builder: (context, child) {
                return child!;
              },
            );
          },
        ),
      ),
    );
  }
}
