import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/history_model.dart';

class HistoryService {

  static const String baseUrl =
      "http://192.168.18.167/servis_mobile/api";

  Future<List<HistoryModel>> getHistory(int userId) async {

    final response = await http.get(
      Uri.parse("$baseUrl/history.php?user_id=$userId"),
    );

    final data = jsonDecode(response.body);

    if(data["status"]=="success"){

      return (data["data"] as List)
          .map((e)=>HistoryModel.fromJson(e))
          .toList();

    }

    return [];

  }

}