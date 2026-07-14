import 'package:flutter/material.dart';

import '../../models/tracking_model.dart';
import '../../services/tracking_service.dart';

class TrackingPage extends StatefulWidget {
  final int userId;

  const TrackingPage({
    super.key,
    required this.userId,
  });

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  final TrackingService trackingService = TrackingService();

  late Future<TrackingModel?> tracking;

  @override
  void initState() {
    super.initState();
    tracking = trackingService.getTracking(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking Service"),
        centerTitle: true,
      ),
      body: FutureBuilder<TrackingModel?>(
        future: tracking,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Gagal mengambil data"),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text("Belum ada booking"),
            );
          }

          final data = snapshot.data!;

          bool booking = true;
          bool inspection = false;
          bool repair = false;
          bool finish = false;

          switch (data.status) {
            case "Pending":
              booking = true;
              break;

            case "Process":
              booking = true;
              inspection = true;
              repair = true;
              break;

            case "Finished":
              booking = true;
              inspection = true;
              repair = true;
              finish = true;
              break;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [

                        Text(
                          "Booking #${data.id}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          data.vehicleName,
                          style: const TextStyle(fontSize: 17),
                        ),

                        const SizedBox(height: 5),

                        Text(data.vehicleNumber),

                        const SizedBox(height: 5),

                        Text(data.serviceType),

                        const SizedBox(height: 5),

                        Text(
                          "${data.bookingDate} • ${data.bookingTime}",
                          style: const TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 10),

                        Chip(
                          label: Text(data.status),
                          backgroundColor: data.status == "Finished"
                              ? Colors.green.shade100
                              : data.status == "Process"
                                  ? Colors.orange.shade100
                                  : Colors.blue.shade100,
                        ),

                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                _TimelineTile(
                  icon: Icons.book_online,
                  title: "Booking Confirmed",
                  subtitle: "Booking telah diterima",
                  active: booking,
                ),

                _TimelineTile(
                  icon: Icons.search,
                  title: "Vehicle Inspection",
                  subtitle: "Kendaraan sedang diperiksa",
                  active: inspection,
                ),

                _TimelineTile(
                  icon: Icons.build,
                  title: "Repair Process",
                  subtitle: "Kendaraan sedang diperbaiki",
                  active: repair,
                ),

                _TimelineTile(
                  icon: Icons.check_circle,
                  title: "Finished",
                  subtitle: "Kendaraan siap diambil",
                  active: finish,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool active;

  const _TimelineTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Column(
          children: [

            CircleAvatar(
              radius: 22,
              backgroundColor:
                  active ? Colors.blue : Colors.grey.shade300,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),

            Container(
              width: 3,
              height: 65,
              color:
                  active ? Colors.blue : Colors.grey.shade300,
            ),

          ],
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color:
                        active ? Colors.black : Colors.grey,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  subtitle,
                  style: TextStyle(
                    color:
                        active ? Colors.black54 : Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

              ],
            ),
          ),
        ),
      ],
    );
  }
}