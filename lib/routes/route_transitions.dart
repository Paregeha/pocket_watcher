import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// iOS-like soft route motion: no slide, gentle fade only.
CustomTransitionPage<void> buildModernTransitionPage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 220),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final incoming = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeInOut,
      );

      final outgoing = CurvedAnimation(
        parent: secondaryAnimation,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeInOut,
      );

      final fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(incoming);
      final fadeOut = Tween<double>(begin: 1.0, end: 0.97).animate(outgoing);

      return FadeTransition(
        opacity: fadeOut,
        child: FadeTransition(opacity: fadeIn, child: child),
      );
    },
  );
}
