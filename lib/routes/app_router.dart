import 'package:flutter_base_architecture/pages/auth_pages/sign_in_page.dart';
import 'package:flutter_base_architecture/pages/on_boarding_pages/on_boarding1_page.dart';
import 'package:flutter_base_architecture/pages/uncategorized_pages/splash_screen_page/splash_screen_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreenPage()),
    GoRoute(
      path: '/onboarding1',
      builder: (context, state) => const OnBoarding1Page(),
    ),
    GoRoute(path: '/sign_in', builder: (context, state) => const SignInPage()),
  ],
);
