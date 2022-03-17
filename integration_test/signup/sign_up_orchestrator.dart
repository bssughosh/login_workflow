import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_workflow/app/keys.dart';

Future<void> signUpIntegrationTestOrchestrator(
  WidgetTester tester, {
  required String username,
  required String password,
}) async {
  final usernameFormField =
      find.byKey(Key(WidgetKeys.signUpPageUsernameField.name));
  final passwordFormField =
      find.byKey(Key(WidgetKeys.signUpPagePasswordField.name));
  final confirmPasswordFormField =
      find.byKey(Key(WidgetKeys.signUpPageConfirmPasswordField.name));
  final signUpButton =
      find.byKey(Key(WidgetKeys.signUpPageRegisterButton.name));

  await tester.enterText(usernameFormField, username);
  await tester.enterText(passwordFormField, password);
  await tester.enterText(confirmPasswordFormField, password);
  await tester.pumpAndSettle();

  await tester.tap(signUpButton);
  await tester.pumpAndSettle();

  final loginButton = find.byKey(Key(WidgetKeys.loginPageSignInButton.name));
  expect(loginButton, findsOneWidget);
}
