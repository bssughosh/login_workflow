import 'package:get_it/get_it.dart';

import 'app/navigation_service.dart';
import 'core/wrappers/http_request_wrapper.dart';
import 'core/wrappers/shared_preferences_wrapper.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Wrappers
  serviceLocator.registerLazySingleton(() => HttpRequestWrapper());
  serviceLocator.registerLazySingleton(() => SharedPreferencesWrapper());
  serviceLocator.registerLazySingleton(() => NavigationService());

  // Login

  // Sign up

  // Forgot Password

  // Home
}

Future<void> reset() async {}
