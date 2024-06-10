import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/config/router/app_router.dart';

class SlideTransitionPage<T> extends CustomTransitionPage<T> {
  SlideTransitionPage({
    required super.child,
  }) : super(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            bool isPreviousIndexSmaller = AppRouter.navigationStack.previous <
                AppRouter.navigationStack.next;

            isPreviousIndexSmaller = AppRouter.navigationStack.isPopAction
                ? !isPreviousIndexSmaller
                : isPreviousIndexSmaller;

            final forwardOffset = isPreviousIndexSmaller
                ? const Offset(1.0, 0.0)
                : const Offset(-1.0, 0.0);
            final reverseOffset = isPreviousIndexSmaller
                ? const Offset(-1.0, 0.0)
                : const Offset(1.0, 0.0);
            const curve = Curves.easeInOut;

            final forwardTween = Tween(begin: forwardOffset, end: Offset.zero)
                .chain(CurveTween(curve: curve));
            final reverseTween = Tween(begin: Offset.zero, end: reverseOffset)
                .chain(CurveTween(curve: curve));

            final offsetAnimation = animation.drive(forwardTween);
            final secondaryOffsetAnimation =
                secondaryAnimation.drive(reverseTween);

            return SlideTransition(
              position: offsetAnimation,
              child: SlideTransition(
                position: secondaryOffsetAnimation,
                child: child,
              ),
            );
          },
        );
}
