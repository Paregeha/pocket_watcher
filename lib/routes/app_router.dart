import 'package:flutter_base_architecture/pages/auth_pages/sign_in_page.dart';
import 'package:flutter_base_architecture/pages/auth_pages/sign_up_page.dart';
import 'package:flutter_base_architecture/pages/on_boarding_pages/on_boarding1_page.dart';
import 'package:flutter_base_architecture/pages/uncategorized_pages/splash_screen_page/splash_screen_page.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/routes/route_transitions.dart';
import 'package:go_router/go_router.dart';

import '../pages/auth_pages/forgot_password_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.root,
  routes: [
    GoRoute(
      path: AppRoutes.root,
      pageBuilder:
          (context, state) => buildModernTransitionPage(
            state: state,
            child: const SplashScreenPage(),
          ),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      pageBuilder:
          (context, state) => buildModernTransitionPage(
            state: state,
            child: const OnBoarding1Page(),
          ),
    ),
    GoRoute(
      path: AppRoutes.signIn,
      pageBuilder:
          (context, state) => buildModernTransitionPage(
            state: state,
            child: const SignInPage(),
          ),
    ),
    GoRoute(
      path: AppRoutes.signUp,
      pageBuilder:
          (context, state) => buildModernTransitionPage(
            state: state,
            child: const SignUpPage(),
          ),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      pageBuilder:
          (context, state) => buildModernTransitionPage(
            state: state,
            child: const ForgotPasswordPage(),
          ),
    ),
  ],
);
