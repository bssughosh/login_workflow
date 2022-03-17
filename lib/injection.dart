import 'package:get_it/get_it.dart';

import 'app/authentication/data/repository/authentication_repository_impl.dart';
import 'app/authentication/domain/repository/authentication_repository.dart';
import 'app/authentication/domain/usecase/does_user_exist_usecase.dart';
import 'app/authentication/domain/usecase/get_forgot_password_code_usecase.dart';
import 'app/authentication/domain/usecase/get_logged_in_user_usecase.dart';
import 'app/authentication/domain/usecase/get_password_usecase.dart';
import 'app/authentication/domain/usecase/login_usecase.dart';
import 'app/authentication/domain/usecase/logout_usecase.dart';
import 'app/authentication/domain/usecase/signup_usecase.dart';
import 'app/authentication/domain/usecase/verify_forgot_password_code_usecase.dart';
import 'app/home/home_presenter.dart';
import 'app/login/forgot_password/forgot_password_presenter.dart';
import 'app/login/login_presenter.dart';
import 'app/navigation_service.dart';
import 'app/sign_up/sign_up_presenter.dart';
import 'core/wrappers/http_request_wrapper.dart';
import 'core/wrappers/shared_preferences_wrapper.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Wrappers
  serviceLocator
      .registerLazySingleton(() => HttpRequestWrapper(serviceLocator()));
  serviceLocator.registerLazySingleton(() => SharedPreferencesWrapper());
  serviceLocator.registerLazySingleton(() => NavigationService());

  // Authentication
  serviceLocator.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(serviceLocator()));
  serviceLocator
      .registerFactory(() => GetForgotPasswordCodeUsecase(serviceLocator()));
  serviceLocator
      .registerFactory(() => GetLoggedInUserUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => GetPasswordUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => LoginUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => LogoutUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => SignUpUsecase(serviceLocator()));
  serviceLocator
      .registerFactory(() => VerifyForgotPasswordCodeUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => DoesUserExistUsecase(serviceLocator()));

  // Login
  serviceLocator.registerFactory(() => LoginPagePresenter(serviceLocator()));

  // Sign up
  serviceLocator.registerFactory(() => SignUpPagePresenter(serviceLocator()));

  // Forgot Password
  serviceLocator.registerFactory(
      () => ForgotPasswordPagePresenter(serviceLocator(), serviceLocator()));

  // Home
  serviceLocator.registerFactory(
      () => HomePagePresenter(serviceLocator(), serviceLocator()));
}

Future<void> reset() async {
  serviceLocator.resetLazySingleton<AuthenticationRepository>();
}
