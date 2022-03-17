import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_workflow/app/keys.dart';

Future<void> signInIntegrationTestOrchestrator(
  WidgetTester tester, {
  required String username,
  required String password,
}) async {
  final usernameFormField =
      find.byKey(Key(WidgetKeys.loginPageUsernameField.name));
  final passwordFormField =
      find.byKey(Key(WidgetKeys.loginPagePasswordField.name));
  final loginButton = find.byKey(Key(WidgetKeys.loginPageSignInButton.name));

  await tester.enterText(usernameFormField, username);
  await tester.enterText(passwordFormField, password);
  await tester.pumpAndSettle();

  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pumpAndSettle();

  await tester.tap(loginButton);
  await tester.pumpAndSettle();

  final welcomeText = find.text('Welcome $username!');
  expect(welcomeText, findsWidgets);
}
