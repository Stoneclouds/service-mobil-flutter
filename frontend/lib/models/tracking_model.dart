class TrackingModel {

  final int id;
  final String vehicleName;
  final String vehicleNumber;
  final String serviceType;
  final String bookingDate;
  final String bookingTime;
  final String status;

  TrackingModel({

    required this.id,
    required this.vehicleName,
    required this.vehicleNumber,
    required this.serviceType,
    required this.bookingDate,
    required this.bookingTime,
    required this.status,

  });

  factory TrackingModel.fromJson(Map<String,dynamic> json){

    return TrackingModel(

      id: int.parse(json["id"].toString()),

      vehicleName: json["vehicle_name"],

      vehicleNumber: json["vehicle_number"],

      serviceType: json["service_type"],

      bookingDate: json["booking_date"],

      bookingTime: json["booking_time"],

      status: json["status"],

    );

  }

}