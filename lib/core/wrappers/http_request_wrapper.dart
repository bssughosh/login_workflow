import 'shared_preferences_wrapper.dart';

class HttpRequestWrapper {
  final SharedPreferencesWrapper _sharedPreferencesWrapper;

  HttpRequestWrapper(this._sharedPreferencesWrapper);

  Future<void> login({
    required String username,
    required String password,
  }) async {
    await _sharedPreferencesWrapper.login(
      username: username,
      password: password,
    );
  }

  Future<void> logout() async {
    return;
  }

  Future<String> getForgotPasswordCode() async {
    return "123456";
  }

  Future<String> getPassword({required String username}) async {
    return await _sharedPreferencesWrapper.getPasswordForUsername(
      username: username,
    );
  }

  Future<void> signUp({
    required String username,
    required String password,
  }) async {
    await _sharedPreferencesWrapper.signUp(
      username: username,
      password: password,
    );
  }
}
