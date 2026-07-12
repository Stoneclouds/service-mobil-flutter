import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardService {

  static const String baseUrl =
      "http://192.168.18.167/servis_mobile/api";

  Future<Map<String,dynamic>> getStats() async{

    final response = await http.get(

      Uri.parse("$baseUrl/dashboard.php"),

    );

    return jsonDecode(response.body);

  }

}