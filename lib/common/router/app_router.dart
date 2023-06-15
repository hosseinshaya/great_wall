import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:great_wall/presentation/home_page.dart';

class R {
  static const String home = '/';
}

class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    observers: <NavigatorObserver>[BotToastNavigatorObserver()],
    initialLocation: R.home,
    routes: <GoRoute>[
      _route(path: R.home, pageBuilder: (state) => const HomePage()),
    ],
  );

  GoRoute _route(
          {required String path,
          required Widget Function(GoRouterState state) pageBuilder,
          List<GoRoute> routes = const []}) =>
      GoRoute(
        path: path,
        routes: routes,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage<void>(
          key: state.pageKey,
          restorationId: state.pageKey.value,
          child: pageBuilder(state),
        ),
      );
}
