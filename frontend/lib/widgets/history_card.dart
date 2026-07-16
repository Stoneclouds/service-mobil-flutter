import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String vehicleName;
  final String serviceType;
  final String bookingDate;
  final String status;

  const HistoryCard({
    super.key,
    required this.vehicleName,
    required this.serviceType,
    required this.bookingDate,
    required this.status,
  });

  Color getStatusColor() {
    switch (status) {
      case "Finished":
        return Colors.green;

      case "Process":
        return Colors.orange;

      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.car_repair),
        ),

        title: Text(
          vehicleName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          "$serviceType\n$bookingDate",
        ),

        trailing: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: getStatusColor(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}