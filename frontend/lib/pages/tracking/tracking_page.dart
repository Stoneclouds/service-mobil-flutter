import 'package:flutter/material.dart';

import '../../models/tracking_model.dart';
import '../../services/tracking_service.dart';
import '../../widgets/shimmer/tracking_shimmer.dart';

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
        Future<void> refreshTracking() async {

      setState(() {

        tracking =
            trackingService.getTracking(widget.userId);

      });
    }

  

   bool isStepActive(int step, String status) {

            switch (status) {

              case "Pending":
                return step <= 1;

              case "Process":
                return step <= 3;

              case "Finished":
                return step <= 5;

              default:
                return false;

            }
          }
          Color statusColor(String status){

            switch(status){

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
          if(snapshot.connectionState == ConnectionState.waiting){
            return const TrackingShimmer();
          }

          if(snapshot.hasError){

            return Center(

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  const Icon(

                    Icons.wifi_off,

                    size: 80,

                    color: Colors.red,

                  ),

                  const SizedBox(height: 20),

                  const Text(

                    "Tidak dapat terhubung ke server",

                    style: TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize: 18,

                    ),

                  ),

                  const SizedBox(height: 10),

                  const Text(

                    "Silakan periksa koneksi atau coba lagi.",

                  ),

                  const SizedBox(height: 25),

                  ElevatedButton.icon(

                    onPressed: (){

                      setState(() {

                        tracking =
                            trackingService.getTracking(widget.userId);

                      });

                    },

                    icon: const Icon(Icons.refresh),

                    label: const Text("Coba Lagi"),

                  ),

                ],

              ),

            );

          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [

                  Icon(
                    Icons.car_repair,
                    size: 90,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Belum ada booking",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Silakan lakukan booking servis terlebih dahulu.",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                ],
              ),
            );
          }
          final data = snapshot.data!;

          return RefreshIndicator(

           onRefresh: refreshTracking,


            child: SingleChildScrollView(
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
                            backgroundColor: statusColor(data.status),
                            label: Text(
                              data.status,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  _TimelineTile(
                    icon: Icons.book_online,
                    title: "Booking Confirmed",
                    subtitle: "Booking berhasil diterima",
                    active: isStepActive(1, data.status),
                  ),

                  _TimelineTile(
                      icon: Icons.search,
                      title: "Vehicle Inspection",
                      subtitle: "Kendaraan sedang diperiksa",
                      active: isStepActive(2, data.status),
                    ),
                  _TimelineTile(
                      icon: Icons.build,
                      title: "Repair Process",
                      subtitle: "Mobil sedang diperbaiki",
                      active: isStepActive(3, data.status),
                    ),
                  _TimelineTile(
                      icon: Icons.verified,
                      title: "Quality Check",
                      subtitle: "Pengecekan akhir",
                      active: isStepActive(4, data.status),
                    ),

                  _TimelineTile(
                      icon: Icons.check_circle,
                      title: "Completed",
                      subtitle: "Mobil siap diambil",
                      active: isStepActive(5, data.status),
                    ),
                ],
              ),
            )  
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