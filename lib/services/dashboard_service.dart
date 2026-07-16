import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/history_model.dart';

class DashboardService {

  static const String baseUrl =
      "http://192.168.18.167/servis_mobile/api";

  // =============================
  // Dashboard Statistics
  // =============================
  Future<Map<String, dynamic>> getStats(int userId) async {

    final response = await http.get(
      Uri.parse("$baseUrl/dashboard.php?user_id=$userId"),
    );

    return jsonDecode(response.body);
  }

  // =============================
  // Last Booking
  // =============================
  Future<HistoryModel?> getLastBooking(int userId) async {

    final response = await http.get(
      Uri.parse("$baseUrl/last_booking.php?user_id=$userId"),
    );
    if (response.statusCode != 200) {
      throw Exception("Server error");
    }
    final data = jsonDecode(response.body);

    if (data["status"] == "success") {
      return HistoryModel.fromJson(data["data"]);
    }

    return null;
  }
}