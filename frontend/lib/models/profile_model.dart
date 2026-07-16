class ProfileModel {

  final String username;
  final String role;

  final int booking;
  final int points;

  ProfileModel({

    required this.username,
    required this.role,
    required this.booking,
    required this.points,

  });

  factory ProfileModel.fromJson(Map<String,dynamic> json){

    return ProfileModel(

      username: json["username"],

      role: json["role"],

      booking: int.parse(json["booking"].toString()),

      points: int.parse(json["points"].toString()),

    );

  }

}