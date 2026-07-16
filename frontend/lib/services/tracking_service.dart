import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/tracking_model.dart';

class TrackingService {

  static const String baseUrl =
      "http://192.168.18.167/servis_mobile/api";

  Future<TrackingModel?> getTracking(int userId) async {

    final response = await http.get(

      Uri.parse("$baseUrl/tracking.php?user_id=$userId"),

    );

    if (response.statusCode != 200) {
      throw Exception("Server error");
    }
    final data = jsonDecode(response.body);

    if(data["status"]=="success"){

      return TrackingModel.fromJson(data["data"]);

    }

    return null;

  }

}