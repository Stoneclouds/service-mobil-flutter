import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {

  static const String baseUrl =
      "http://192.168.18.167/servis_mobile/api";

  Future<Map<String, dynamic>> login(
      String username,
      String password,
      ) async {

    final response = await http.post(
      Uri.parse("$baseUrl/login.php"),
      body: {
        "username": username,
        "password": password,
      },
    );

    return jsonDecode(response.body);
  }
}