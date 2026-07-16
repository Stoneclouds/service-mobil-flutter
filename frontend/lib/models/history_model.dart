class HistoryModel {

  final int id;

  final String vehicleName;

  final String vehicleNumber;

  final String serviceType;

  final String bookingDate;

  final String bookingTime;

  final String status;

  HistoryModel({

    required this.id,

    required this.vehicleName,

    required this.vehicleNumber,

    required this.serviceType,

    required this.bookingDate,

    required this.bookingTime,

    required this.status,

  });

  factory HistoryModel.fromJson(Map<String,dynamic> json){

    return HistoryModel(

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