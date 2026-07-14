import 'package:flutter/material.dart';

class AdminBookingPage extends StatelessWidget {
  const AdminBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Booking"),
      ),
      body: const Center(
        child: Text(
          "Daftar Booking Admin",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}