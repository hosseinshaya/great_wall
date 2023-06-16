import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:great_wall/domain/entity/wallpaper.dart';
import 'package:great_wall/presentation/home_page.dart';
import 'package:great_wall/presentation/wallpaper_detail_page.dart';

class R {
  static const String home = '/';
  static const String _wallpaperDetail = '/wallpaper/:id';
  static String wallpaperDetail({required String id}) =>
      _wallpaperDetail.replaceFirst(':id', id);
}

class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    observers: <NavigatorObserver>[BotToastNavigatorObserver()],
    initialLocation: R.home,
    routes: <GoRoute>[
      _route(path: R.home, pageBuilder: (state) => const HomePage()),
      _route(
        path: R._wallpaperDetail,
        pageBuilder: (state) =>
            // ignore: cast_nullable_to_non_nullable
            WallpaperDetailPage(state.extra as Wallpaper),
      ),
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
