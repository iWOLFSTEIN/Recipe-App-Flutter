import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/config/router/route_item.dart';
import 'package:recipes_app/features/recipes/presentation/pages/explore.dart';
import 'package:recipes_app/features/recipes/presentation/pages/home.dart';
import 'package:recipes_app/features/recipes/presentation/pages/recipes.dart';
import 'package:recipes_app/features/recipes/presentation/pages/settings.dart';

class AppRouter {
  static const RouteItem recipes = RouteItem(name: 'recipes', path: '/recipes');
  static const RouteItem explore = RouteItem(name: 'explore', path: '/explore');
  static const RouteItem settings =
      RouteItem(name: 'settings', path: '/settings');

  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    initialLocation: recipes.path,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return Home(child: child);
        },
        routes: [
          GoRoute(
            path: recipes.path,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Recipes(),
            ),
          ),
          GoRoute(
            path: explore.path,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Explore(),
            ),
          ),
          GoRoute(
            path: settings.path,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Settings(),
            ),
          ),
        ],
      ),
    ],
  );
}
