import 'package:flutter/material.dart';

import 'dashboard/dashboard_page.dart';
import 'booking/booking_page.dart';
import 'tracking/tracking_page.dart';
import 'profile/profile_page.dart';


class HomePage extends StatefulWidget {

  final int userId;
  final String username;
  final String role;

  const HomePage({
    super.key,
    required this.userId,
    required this.username,
    required this.role,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  

  @override
  Widget build(BuildContext context) {
    final pages = [

      Dashboard(
        userId: widget.userId,
        username: widget.username,
        role: widget.role,
      ),

      BookingPage(
        userId: widget.userId,
      ),

      TrackingPage(
        userId: widget.userId,
      ),

      ProfilePage(
        userId: widget.userId,
        username: widget.username,
        role: widget.role,
      ),

    ];
    return Scaffold(
      body: pages[currentIndex],

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