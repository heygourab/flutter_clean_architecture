import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter_clean_architecture/features/home/presentation/layout/home_layout.dart';
import 'package:flutter_clean_architecture/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_clean_architecture/router/guards.dart';
import 'package:flutter_clean_architecture/router/routes.dart';
import 'package:go_router/go_router.dart';

final class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: Routes.splash,
        redirect: AuthGuard.guard,
        routes: [
          // Splash Route
          GoRoute(
            path: Routes.splash,
            builder: (context, state) => const SplashScreen(),
          ),
          // Auth Routes
          GoRoute(
            path: Routes.login,
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: Routes.register,
            builder: (context, state) => const RegisterScreen(),
          ),
          // Home Routes with ShellRoute
          ShellRoute(
            builder: (context, state, child) => HomeLayout(child: child),
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
        ],
      );
}
