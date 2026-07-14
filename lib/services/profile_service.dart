import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/profile_model.dart';

class ProfileService {

  static const String baseUrl =
      "http://192.168.18.167/servis_mobile/api";

  Future<ProfileModel?> getProfile(int userId) async {

    final response = await http.get(

      Uri.parse(
        "$baseUrl/profile.php?user_id=$userId",
      ),

    );

    final data = jsonDecode(response.body);

    if(data["status"]=="success"){

      return ProfileModel.fromJson(

        data["data"],

      );

    }

    return null;

  }

}