import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../exceptions.dart';

class SharedPreferencesWrapper {
  Future<void> login({
    required String username,
    required String password,
  }) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    final String? uniqueId = _prefs.getString(username);
    if (uniqueId == null) {
      throw UserNotRegisteredException();
    }

    final String? _password = _prefs.getString(uniqueId);
    if (_password == null) {
      throw UsernamePasswordMismatchException();
    }

    if (password != _password) {
      throw UsernamePasswordMismatchException();
    }

    return;
  }

  Future<void> signUp({
    required String username,
    required String password,
  }) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.containsKey(username)) {
      throw UserAlreadyRegisteredException();
    }

    const Uuid _uuid = Uuid();

    final String _uniqueId = _uuid.v1();

    await _prefs.setString(username, _uniqueId);

    await _prefs.setString(_uniqueId, password);
  }
}
