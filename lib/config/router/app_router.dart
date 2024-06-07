import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/config/router/route_item.dart';
import 'package:recipes_app/features/recipes/presentation/pages/explore.dart';
import 'package:recipes_app/features/recipes/presentation/pages/main_view.dart';
import 'package:recipes_app/features/recipes/presentation/pages/recipes.dart';
import 'package:recipes_app/features/recipes/presentation/pages/settings.dart';

class AppRouter {
  static final List<int> navigationStack = [];

  static const RouteItem recipes =
      RouteItem(id: 0, name: 'recipes', path: '/recipes');
  static const RouteItem explore =
      RouteItem(id: 1, name: 'explore', path: '/explore');
  static const RouteItem settings =
      RouteItem(id: 2, name: 'settings', path: '/settings');

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
              previousIndex:
                  navigationStack.isEmpty ? -1 : navigationStack.last,
              nextIndex: recipes.id!,
              child: const Recipes(),
            ),
          ),
          GoRoute(
            path: explore.path,
            pageBuilder: (context, state) => SlideTransitionPage(
              previousIndex: navigationStack.last,
              nextIndex: explore.id!,
              child: const Explore(),
            ),
          ),
          GoRoute(
            path: settings.path,
            pageBuilder: (context, state) => SlideTransitionPage(
              previousIndex: navigationStack.last,
              nextIndex: settings.id!,
              child: const Settings(),
            ),
          ),
        ],
      ),
    ],
  );
}

// class SlideTransitionPage<T> extends CustomTransitionPage<T> {

//   final Widget child;

//   SlideTransitionPage({required this.child})
//       : super(
//           transitionDuration: const Duration(milliseconds: 300),
//           reverseTransitionDuration: const Duration(milliseconds: 300),
//           child: child,
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             const begin = Offset(1.0, 0.0);
//             const end = Offset.zero;
//             const curve = Curves.easeInOut;

//             final tween =
//                 Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//             return SlideTransition(
//               position: animation.drive(tween),
//               child: child,
//             );
//           },
//         );
// }

// class SlideTransitionPage<T> extends CustomTransitionPage<T> {
//   final Widget child;

//   SlideTransitionPage({required this.child})
//       : super(
//           transitionDuration: const Duration(milliseconds: 300),
//           reverseTransitionDuration: const Duration(milliseconds: 300),
//           child: child,
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             const forwardBegin = Offset(1.0, 0.0);
//             const forwardEnd = Offset.zero;
//             const reverseBegin = Offset.zero;
//             const reverseEnd = Offset(-1.0, 0.0);
//             const curve = Curves.easeInOut;

//             final forwardTween = Tween(begin: forwardBegin, end: forwardEnd)
//                 .chain(CurveTween(curve: curve));
//             final reverseTween = Tween(begin: reverseBegin, end: reverseEnd)
//                 .chain(CurveTween(curve: curve));

//             final offsetAnimation = animation.drive(forwardTween);
//             final reverseOffsetAnimation =
//                 secondaryAnimation.drive(reverseTween);

//             return SlideTransition(
//               position: offsetAnimation,
//               child: SlideTransition(
//                 position: reverseOffsetAnimation,
//                 child: child,
//               ),
//             );
//           },
//         );
// }

class SlideTransitionPage<T> extends CustomTransitionPage<T> {
  final Widget child;
  final int previousIndex;
  final int nextIndex;

  SlideTransitionPage({
    required this.child,
    required this.previousIndex,
    required this.nextIndex,
  }) : super(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final begin = nextIndex < previousIndex
                ? const Offset(-1.0, 0.0)
                : const Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
