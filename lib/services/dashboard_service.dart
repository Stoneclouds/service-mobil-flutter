import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardService {

  static const String baseUrl =
      "http://192.168.18.167/servis_mobile/api";

  Future<Map<String, dynamic>> getStats(int userId) async {

    final response = await http.get(

      Uri.parse(
        "$baseUrl/dashboard.php?user_id=$userId",
      ),

    );

    return jsonDecode(response.body);

  }
}