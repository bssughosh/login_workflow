import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_workflow/app/keys.dart';

Future<void> logoutIntegrationTestOrchestrator(WidgetTester tester) async {
  final logoutButton = find.byKey(Key(WidgetKeys.homePageLogoutButton.name));

  await tester.tap(logoutButton);
  await tester.pumpAndSettle();

  final loginButton = find.byKey(Key(WidgetKeys.loginPageSignInButton.name));
  expect(loginButton, findsOneWidget);
}
