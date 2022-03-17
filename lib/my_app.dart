import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/icons/logo.png'), context);
    precacheImage(
        const AssetImage('assets/icons/welcome-background.png'), context);
    precacheImage(
        const AssetImage('assets/icons/registration_100px.png'), context);
    precacheImage(const AssetImage('assets/icons/registration.png'), context);
    precacheImage(const AssetImage('assets/icons/login_240px.png'), context);
    precacheImage(const AssetImage('assets/icons/menu.png'), context);

    return MaterialApp(
      title: 'Flutter Login Workflow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
