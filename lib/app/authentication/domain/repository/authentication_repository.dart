abstract class AuthenticationRepository {
  Future<void> login({required String username, required String password});

  Future<void> logout();

  Future<String> getForgotPasswordCode();

  Future<bool> verifyForgotPasswordCode();

  Future<void> resetPassword();

  Future<void> signUp({required String username, required String password});

  String? get loggedInUser;
}
