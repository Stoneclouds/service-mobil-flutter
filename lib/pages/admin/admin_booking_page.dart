import 'package:flutter/material.dart';

import '../../models/admin_booking_model.dart';
import '../../services/admin_service.dart';

class AdminBookingPage extends StatefulWidget {
  const AdminBookingPage({super.key});

  @override
  State<AdminBookingPage> createState() => _AdminBookingPageState();
}

class _AdminBookingPageState extends State<AdminBookingPage> {

  final AdminService adminService = AdminService();

  late Future<List<AdminBookingModel>> bookings;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    bookings = adminService.getBookings();
  }

  Color statusColor(String status) {

    switch (status) {

      case "Pending":
        return Colors.orange;

      case "Process":
        return Colors.blue;

      case "Finished":
        return Colors.green;

      default:
        return Colors.grey;

    }

  }

  Future<void> updateStatus(
      AdminBookingModel booking,
      String status,
      ) async {

    bool success = await adminService.updateStatus(
      booking.id,
      status,
    );

    if(success){

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(
          content: Text("Status berhasil diperbarui"),
        ),

      );

      setState(() {
        loadData();
      });

    }

  }

  void showStatusDialog(AdminBookingModel booking){

    showDialog(

      context: context,

      builder: (_){

        return AlertDialog(

          title: const Text("Update Status"),

          content: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              ListTile(

                title: const Text("Pending"),

                onTap: (){
                  Navigator.pop(context);
                  updateStatus(booking,"Pending");
                },

              ),

              ListTile(

                title: const Text("Process"),

                onTap: (){
                  Navigator.pop(context);
                  updateStatus(booking,"Process");
                },

              ),

              ListTile(

                title: const Text("Finished"),

                onTap: (){
                  Navigator.pop(context);
                  updateStatus(booking,"Finished");
                },

              ),

            ],

          ),

        );

      },

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Admin Booking"),
      ),

      body: FutureBuilder<List<AdminBookingModel>>(

        future: bookings,

        builder: (context,snapshot){

          if(snapshot.connectionState==ConnectionState.waiting){

            return const Center(
              child: CircularProgressIndicator(),
            );

          }

          if(!snapshot.hasData || snapshot.data!.isEmpty){

            return const Center(
              child: Text("Belum ada booking"),
            );

          }

          final data = snapshot.data!;

          return RefreshIndicator(

            onRefresh: () async{

              setState(() {
                loadData();
              });

            },

            child: ListView.builder(

              itemCount: data.length,

              itemBuilder: (context,index){

                final booking = data[index];

                return Card(

                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),

                  elevation: 3,

                  child: ListTile(

                    leading: CircleAvatar(

                      backgroundColor: statusColor(
                        booking.status,
                      ),

                      child: const Icon(
                        Icons.car_repair,
                        color: Colors.white,
                      ),

                    ),

                    title: Text(

                      booking.vehicleName,

                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),

                    ),

                    subtitle: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text("User : ${booking.username}"),

                        Text("Service : ${booking.serviceType}"),

                        Text(
                          "${booking.bookingDate}  ${booking.bookingTime}",
                        ),

                        const SizedBox(height:6),

                        Chip(

                          label: Text(booking.status),

                          backgroundColor:
                          statusColor(booking.status),

                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),

                        ),

                      ],

                    ),

                    trailing: IconButton(

                      icon: const Icon(Icons.edit),

                      onPressed: (){

                        showStatusDialog(booking);

                      },

                    ),

                  ),

                );

              },

            ),

          );

        },

      ),

    );

  }

}