abstract class AuthenticationRepository {
  Future<void> login({required String username, required String password});

  Future<void> logout();

  Future<String> getForgotPasswordCode();

  Future<bool> verifyForgotPasswordCode({required String enteredCode});

  Future<bool> doesUsernameExist({required String username});

  Future<String> getPassword({required String username});

  Future<void> signUp({required String username, required String password});

  String get loggedInUser;
}
