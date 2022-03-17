import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:login_workflow/main.dart' as app;

import 'forgot_password/forgot_password_orchestrator.dart';
import 'home/logout_orchestrator.dart';
import 'login/click_forgot_password_button.dart';
import 'login/click_sign_up_button.dart';
import 'login/sign_in_orchestrator.dart';
import 'signup/sign_up_orchestrator.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'Integration tests for all workflows of the app',
    () {
      final String _username = 'test-${DateTime.now().millisecondsSinceEpoch}';
      const String _password = '12345';

      testWidgets(
        'Sign up -> Forgot Password -> Sign In -> Home',
        (tester) async {
          await app.main(initDependencyInjection: true);

          await tester.pumpAndSettle();

          await clickSignUpButtonIntegrationTest(tester);

          await signUpIntegrationTestOrchestrator(
            tester,
            username: _username,
            password: _password,
          );

          await clickForgotPasswordButtonIntegrationTest(tester);

          await forgotPasswordIntegrationTestOrchestrator(
            tester,
            username: _username,
          );

          await signInIntegrationTestOrchestrator(
            tester,
            username: _username,
            password: _password,
          );
        },
      );

      testWidgets(
        'Sign In -> Home -> Logout',
        (tester) async {
          await app.main(initDependencyInjection: false);

          await tester.pumpAndSettle();

          await signInIntegrationTestOrchestrator(
            tester,
            username: _username,
            password: _password,
          );

          await logoutIntegrationTestOrchestrator(tester);
        },
      );
    },
  );
}
