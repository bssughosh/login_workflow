import '../../../../core/exceptions.dart';
import '../../../../core/wrappers/http_request_wrapper.dart';
import '../../domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final HttpRequestWrapper _httpRequestWrapper;

  AuthenticationRepositoryImpl(this._httpRequestWrapper);

  String? _loggedInUsername;
  String? _forgotPasswordCode;

  @override
  Future<String> getForgotPasswordCode() async {
    _forgotPasswordCode = await _httpRequestWrapper.getForgotPasswordCode();

    return _forgotPasswordCode!;
  }

  @override
  Future<void> login({
    required String username,
    required String password,
  }) async {
    await _httpRequestWrapper.login(username: username, password: password);

    _loggedInUsername = username;
  }

  @override
  Future<void> logout() async {
    _loggedInUsername = null;
  }

  @override
  Future<String> getPassword({required String username}) async {
    _forgotPasswordCode = null;
    return await _httpRequestWrapper.getPassword(username: username);
  }

  @override
  Future<void> signUp(
      {required String username, required String password}) async {
    await _httpRequestWrapper.signUp(username: username, password: password);
  }

  @override
  Future<bool> verifyForgotPasswordCode({required String enteredCode}) async {
    if (_forgotPasswordCode == enteredCode) {
      return true;
    }

    return false;
  }

  @override
  String get loggedInUser {
    if (_loggedInUsername == null) {
      throw UserNotLoggedInException();
    }

    return _loggedInUsername!;
  }

  @override
  Future<bool> doesUsernameExist({required String username}) async {
    return await _httpRequestWrapper.doesUserExist(username: username);
  }
}
