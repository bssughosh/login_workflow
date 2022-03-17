import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_workflow/app/keys.dart';

Future<void> clickSignUpButtonIntegrationTest(WidgetTester tester) async {
  final signUpButton = find.byKey(Key(WidgetKeys.loginPageSignUpButton.name));

  await tester.tap(signUpButton);
  await tester.pumpAndSettle();
}
