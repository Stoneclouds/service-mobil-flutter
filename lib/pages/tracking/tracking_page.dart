import 'package:flutter/material.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking Service"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [

                    Text(
                      "Booking #SRV-2026001",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Toyota Avanza",
                      style: TextStyle(fontSize: 16),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Estimated Finish : 08 July 2026",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const _TimelineTile(
              icon: Icons.book_online,
              title: "Booking Confirmed",
              subtitle: "Your booking has been received.",
              active: true,
            ),

            const _TimelineTile(
              icon: Icons.search,
              title: "Vehicle Inspection",
              subtitle: "Vehicle is being checked.",
              active: true,
            ),

            const _TimelineTile(
              icon: Icons.build,
              title: "Repair Process",
              subtitle: "Mechanic is repairing your vehicle.",
              active: true,
            ),

            const _TimelineTile(
              icon: Icons.verified,
              title: "Quality Check",
              subtitle: "Waiting for inspection.",
              active: false,
            ),

            const _TimelineTile(
              icon: Icons.check_circle,
              title: "Completed",
              subtitle: "Vehicle is ready to pick up.",
              active: false,
            ),

          ],
        ),
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
            )

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
        )

      ],
    );
  }
}