import 'package:login_workflow/app/authentication/domain/repository/authentication_repository.dart';
import 'package:login_workflow/core/wrappers/http_request_wrapper.dart';
import 'package:login_workflow/core/wrappers/shared_preferences_wrapper.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final HttpRequestWrapper _httpRequestWrapper;
  final SharedPreferencesWrapper _sharedPreferencesWrapper;

  AuthenticationRepositoryImpl(
    this._httpRequestWrapper,
    this._sharedPreferencesWrapper,
  );

  String? _loggedInUsername;

  @override
  Future<String> getForgotPasswordCode() {
    // TODO: implement getForgotPasswordCode
    throw UnimplementedError();
  }

  @override
  Future<void> login({required String username, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signUp({required String username, required String password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyForgotPasswordCode() {
    // TODO: implement verifyForgotPasswordCode
    throw UnimplementedError();
  }

  @override
  String? get loggedInUser => _loggedInUsername;
}
