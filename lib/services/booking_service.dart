import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/booking_model.dart';

class BookingService {

  static const String baseUrl =
      "http://192.168.18.167/servis_mobile/api";

  Future<bool> booking(BookingModel booking) async {

    final response = await http.post(
      Uri.parse("$baseUrl/booking.php"),
      body: booking.toJson(),
    );
    if (response.statusCode != 200) {
      throw Exception("Server error");
    }
    final data = jsonDecode(response.body);

    return data["status"] == "success";
  }
}