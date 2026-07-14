class AdminBookingModel {

  final int id;
  final String username;
  final String vehicleName;
  final String serviceType;
  final String bookingDate;
  final String bookingTime;
  final String status;

  AdminBookingModel({

    required this.id,
    required this.username,
    required this.vehicleName,
    required this.serviceType,
    required this.bookingDate,
    required this.bookingTime,
    required this.status,

  });

  factory AdminBookingModel.fromJson(Map<String,dynamic> json){

    return AdminBookingModel(

      id: int.parse(json["id"].toString()),

      username: json["username"],

      vehicleName: json["vehicle_name"],

      serviceType: json["service_type"],

      bookingDate: json["booking_date"],

      bookingTime: json["booking_time"],

      status: json["status"],

    );

  }

}