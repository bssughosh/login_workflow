import 'package:flutter/material.dart';

import 'login/login_view.dart';
import 'sign_up/sign_up_view.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String signInRoute = "/signin";

  static const String signUpRoute = "/signUp";

  static const String homeRoute = "/home";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signInRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());

      case homeRoute:
        return null;

      case '/':
        // don't generate route on start-up
        return null;

      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
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
