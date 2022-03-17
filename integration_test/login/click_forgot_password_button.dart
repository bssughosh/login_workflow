import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_workflow/app/keys.dart';

Future<void> clickForgotPasswordButtonIntegrationTest(
    WidgetTester tester) async {
  final forgotPasswordButton =
      find.byKey(Key(WidgetKeys.loginPageForgotPasswordButton.name));

  await tester.tap(forgotPasswordButton);
  await tester.pumpAndSettle();
}
