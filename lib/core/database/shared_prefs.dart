import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String _keyUsername = 'username';
  static const String _keyPassword = 'password';
  static const String _keyIsLoggedIn = 'isLoggedIn';
  static const String _keyRememberMe = 'rememberMe';
  static const String _token = 'token';
  static const String _userId = 'userId';

  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userId);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_token, token);
  }

  static Future<void> removeLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // Save user credentials when Remember Me is checked
  static Future<void> saveCredentials({
    required String username,
    required String password,
    required bool rememberMe,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    if (rememberMe) {
      await prefs.setString(_keyUsername, username);
      await prefs.setString(_keyPassword, password);
      await prefs.setBool(_keyRememberMe, true);
      await prefs.setBool(_keyIsLoggedIn, true);
    } else {
      await clearCredentials();
    }
  }

  // Check if user is logged in and remembered
  static Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  // Get stored credentials
  static Future<Map<String, String>> getStoredCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      _keyUsername: prefs.getString(_keyUsername) ?? '',
      _keyPassword: prefs.getString(_keyPassword) ?? '',
    };
  }

  // Clear stored credentials on logout
  static Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUsername);
    await prefs.remove(_keyPassword);
    await prefs.remove(_keyRememberMe);
    await prefs.remove(_keyIsLoggedIn);
  }
}
