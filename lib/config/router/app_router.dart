import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/config/router/custom_transitions.dart';
import 'package:recipes_app/config/router/navigation_stack.dart';
import 'package:recipes_app/config/router/route_item.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes.dart';
import 'package:recipes_app/features/recipes/presentation/pages/explore.dart';
import 'package:recipes_app/features/recipes/presentation/pages/main_view.dart';
import 'package:recipes_app/features/recipes/presentation/pages/recipe_detail_view.dart';
import 'package:recipes_app/features/recipes/presentation/pages/recipes.dart';
import 'package:recipes_app/features/recipes/presentation/pages/settings.dart';

class AppRouter {
  static final NavigationStack navigationStack = NavigationStack();

  static const RouteItem recipes =
      RouteItem(id: 0, name: 'recipes', path: '/recipes');
  static const RouteItem explore =
      RouteItem(id: 1, name: 'explore', path: '/explore');
  static const RouteItem settings =
      RouteItem(id: 2, name: 'settings', path: '/settings');
  static const RouteItem recipeDetailView = RouteItem(
      id: 2, name: 'recipeDetailView', path: '/recipes/recipeDetailView');

  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: recipes.path,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainView(child: child);
        },
        routes: [
          GoRoute(
            path: recipes.path,
            pageBuilder: (context, state) => SlideTransitionPage(
              child: const Recipes(),
            ),
          ),
          GoRoute(
            path: explore.path,
            pageBuilder: (context, state) => SlideTransitionPage(
              child: const Explore(),
            ),
          ),
          GoRoute(
            path: settings.path,
            pageBuilder: (context, state) => SlideTransitionPage(
              child: const Settings(),
            ),
          ),
          GoRoute(
              path: recipeDetailView.path,
              pageBuilder: (context, state) => MaterialPage(
                      child: RecipeDetailView(
                    recipe: state.extra as RecipeEntity,
                  ))),
        ],
      ),
    ],
  );
}
