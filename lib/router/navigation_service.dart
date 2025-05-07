import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/router/routes.dart';
import 'package:go_router/go_router.dart';

abstract final class NavigationService {
  static void push(BuildContext context, String location, {Object? extra}) {
    context.push(location, extra: extra);
  }

  static void pushReplacement(BuildContext context, String location,
      {Object? extra}) {
    context.pushReplacement(location, extra: extra);
  }

  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    context.pop(result);
  }

  static void go(BuildContext context, String location, {Object? extra}) {
    context.go(location, extra: extra);
  }

  // Navigation shortcuts for common routes
  static void goToHome(BuildContext context) => go(context, Routes.home);
  static void goToLogin(BuildContext context) => go(context, Routes.login);
  static void goToProfile(BuildContext context) => go(context, Routes.profile);
}
