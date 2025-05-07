import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/auth/providers/auth_providers.dart';
import 'package:flutter_clean_architecture/router/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Authentication guard for route protection
abstract final class AuthGuard {
  static String? guard(BuildContext context, GoRouterState state) {
    final container = ProviderScope.containerOf(context);
    final authState = container.read(authNotifierProvider);

    final bool isAuthenticated = authState.maybeWhen(
      authenticated: (_) => true,
      orElse: () => false,
    );

    // Define which routes should be accessible without authentication
    final bool isAuthRoute = state.matchedLocation == Routes.login ||
        state.matchedLocation == Routes.register ||
        state.matchedLocation == Routes.splash;

    // Redirect logic
    if (!isAuthenticated && !isAuthRoute) {
      // User is not authenticated and tries to access protected route
      return Routes.login;
    } else if (isAuthenticated && isAuthRoute) {
      // User is authenticated but tries to access auth routes
      return Routes.home;
    }

    // No redirect needed
    return null;
  }
}
