import 'package:flutter/material.dart';
import 'package:login_workflow/core/constants.dart';

import 'app/navigation_service.dart';
import 'injection.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Workflow',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: NavigationService.signInRoute,
      onGenerateRoute: NavigationService.generateRoute,
      navigatorKey: di.serviceLocator<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
