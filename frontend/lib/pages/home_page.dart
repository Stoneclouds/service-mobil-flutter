import 'package:flutter/material.dart';

import 'dashboard/dashboard_page.dart';
import 'booking/booking_page.dart';
import 'tracking/tracking_page.dart';
import 'profile/profile_page.dart';


class HomePage extends StatefulWidget {
  final String username;
  final String role;

  const HomePage({
    super.key,
    required this.username,
    required this.role,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  late final List<Widget> pages;
  
  @override
  void initState() {
    super.initState();

    pages = [
      Dashboard(
        username: widget.username,
        role    : widget.role,
      ),
      BookingPage(
        username: widget.username,
      ),
      const TrackingPage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.car_repair),
        label: const Text("Booking"),
        onPressed: () {
          setState(() {
            currentIndex = 1;
          });
        },
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,

        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: "Home",
          ),

          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: "Booking",
          ),

          NavigationDestination(
            icon: Icon(Icons.location_searching_outlined),
            selectedIcon: Icon(Icons.location_searching),
            label: "Tracking",
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}