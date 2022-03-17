import 'shared_preferences_wrapper.dart';

class HttpRequestWrapper {
  final SharedPreferencesWrapper _sharedPreferencesWrapper;

  HttpRequestWrapper(this._sharedPreferencesWrapper);

  Future<void> login({
    required String username,
    required String password,
  }) async {}

  Future<void> logout() async {}

  Future<String> getForgotPasswordCode() async {
    return "123456";
  }

  Future<void> resetPassword() async {}

  Future<void> signUp({
    required String username,
    required String password,
  }) async {}
}
