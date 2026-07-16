import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static const String keyId = "user_id";
  static const String keyUsername = "username";
  static const String keyRole = "role";

  Future<void> saveLogin({
    required int id,
    required String username,
    required String role,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(keyId, id);
    await prefs.setString(keyUsername, username);
    await prefs.setString(keyRole, role);
  }

  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(keyId);
  }

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyUsername);
  }

  Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyRole);
  }

  Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(keyId);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}