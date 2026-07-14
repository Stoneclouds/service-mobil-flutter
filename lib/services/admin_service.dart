import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/api.dart';

class AdminService {
  Future<List> getBooking() async {
    final response = await http.get(
      Uri.parse("${Api.baseUrl}/admin/get_booking.php"),
    );

    return jsonDecode(response.body);
  }
}