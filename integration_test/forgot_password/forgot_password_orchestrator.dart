import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_workflow/app/keys.dart';

Future<void> forgotPasswordIntegrationTestOrchestrator(
  WidgetTester tester, {
  required String username,
}) async {
  final usernameFormField =
      find.byKey(Key(WidgetKeys.forgotPasswordPageUsernameField.name));
  final submitUsernameButton =
      find.byKey(Key(WidgetKeys.forgotPasswordPageSubmitUsernameButton.name));

  await tester.enterText(usernameFormField, username);
  await tester.pumpAndSettle();

  await tester.tap(submitUsernameButton);
  await tester.pumpAndSettle();

  final doneButton =
      find.byKey(Key(WidgetKeys.forgotPasswordPageDoneButton.name));
  expect(doneButton, findsOneWidget);
  await tester.tap(doneButton);
}
