import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String signInRoute = "/signin";

  static const String signUpRoute = "/signUp";

  static const String forgotPasswordRoute = "/forgotPassword";

  static const String homeRoute = "/home";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        // don't generate route on start-up
        return null;

      default:
        return null;
    }
  }

  Future<void> navigateTo(String routeName,
      {bool shouldReplace = false, Object? arguments}) {
    if (shouldReplace) {
      return navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void navigateBack() {
    return navigatorKey.currentState!.pop();
  }
}
