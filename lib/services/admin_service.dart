import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/admin_booking_model.dart';

class AdminService {

  static const String baseUrl =
      "http://192.168.18.167/servis_mobile/api";

  Future<List<AdminBookingModel>> getBookings() async {

    final response = await http.get(
      Uri.parse("$baseUrl/admin_booking.php"),
    );

    final data = jsonDecode(response.body);

    if(data["status"] != "success"){
      return [];
    }

    return (data["data"] as List)
        .map((e)=>AdminBookingModel.fromJson(e))
        .toList();

  }

  Future<bool> updateStatus(
      int id,
      String status,
      ) async {

    final response = await http.post(

      Uri.parse("$baseUrl/update_status.php"),

      body: {

        "id": id.toString(),

        "status": status,

      },

    );

    final data = jsonDecode(response.body);

    return data["status"]=="success";

  }

}