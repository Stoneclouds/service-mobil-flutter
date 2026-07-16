class BookingModel {

  final int userId;

  final String vehicleName;

  final String vehicleNumber;

  final String serviceType;

  final String bookingDate;

  final String bookingTime;

  final String notes;

  BookingModel({

    required this.userId,

    required this.vehicleName,

    required this.vehicleNumber,

    required this.serviceType,

    required this.bookingDate,

    required this.bookingTime,

    required this.notes,

  });

  Map<String,String> toJson(){

    return{

      "user_id":userId.toString(),

      "vehicle_name":vehicleName,

      "vehicle_number":vehicleNumber,

      "service_type":serviceType,

      "booking_date":bookingDate,

      "booking_time":bookingTime,

      "notes":notes,

    };

  }

}