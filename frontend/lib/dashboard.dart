import 'package:flutter/material.dart';

import 'booking.dart';
import 'tracking.dart';
import 'admin_page.dart';

class Dashboard extends StatelessWidget {

  final String username;
  final String role;

  const Dashboard({
    super.key,
    required this.username,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.blue[50],

      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    "Halo, $username 👋",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Mau servis mobil hari ini?",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Booking(
                      username: username,
                    ),
                  ),
                );
              },

              icon: const Icon(Icons.book_online),
              label: const Text("Booking Servis"),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Tracking(
                      username: username,
                    ),
                  ),
                );
              },

              icon: const Icon(Icons.track_changes),
              label: const Text("Tracking Servis"),
            ),

            const SizedBox(height: 15),

            if(role == "admin")

              ElevatedButton.icon(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AdminPage(),
                    ),
                  );
                },

                icon: const Icon(Icons.admin_panel_settings),
                label: const Text("Kelola Servis"),
              )
          ],
        ),
      ),
    );
  }
}