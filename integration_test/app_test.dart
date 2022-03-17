import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:login_workflow/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'Integration tests for all workflows of the app',
    () {
      testWidgets(
        'Sign up -> Forgot Password -> Sign In',
        (tester) async {
          await app.main(initDependencyInjection: true);

          await tester.pumpAndSettle();
        },
      );
    },
  );
}
