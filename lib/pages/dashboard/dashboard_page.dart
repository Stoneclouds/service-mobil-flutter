import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../../services/dashboard_service.dart';

import '../../widgets/greeting_card.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/quick_action_card.dart';
import '../../widgets/promo_card.dart';
import '../../widgets/history_card.dart';
import '../../widgets/shimmer/dashboard_shimmer.dart';

import '../booking/booking_page.dart';
import '../tracking/tracking_page.dart';
import '../profile/profile_page.dart';
import '../admin/admin_booking_page.dart';

class Dashboard extends StatefulWidget {
  final int userId;
  final String username;
  final String role;
  const Dashboard({
    super.key,
    required this.userId,
    required this.username,
    required this.role,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardService dashboardService = DashboardService();

  late Future<Map<String, dynamic>> stats;

  @override
  void initState() {
    super.initState();

    loadDashboard();
  }

  Future<void> loadDashboard() async {
    setState(() {
      stats = dashboardService.getStats(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: stats,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const DashboardShimmer();
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text("Gagal mengambil data dashboard"),
          );
        }

        final data = snapshot.data!;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              FadeInDown(
                child: GreetingCard(
                  username: widget.username,
                ),
              ),

              const SizedBox(height: 25),

              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Row(
                  children: [

                    StatCard(
                      title: "Booking",
                      value: data["booking"].toString(),
                      icon: Icons.calendar_month,
                      color: Colors.blue,
                    ),

                    const SizedBox(width: 15),

                    StatCard(
                      title: "Pending",
                      value: data["pending"].toString(),
                      icon: Icons.pending_actions,
                      color: Colors.orange,
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 15),

              FadeInUp(
                delay: const Duration(milliseconds: 400),
                child: Row(
                  children: [

                    StatCard(
                      title: "Done",
                      value: data["done"].toString(),
                      icon: Icons.check_circle,
                      color: Colors.green,
                    ),

                    const SizedBox(width: 15),

                    StatCard(
                      title: "Points",
                      value: data["points"].toString(),
                      icon: Icons.star,
                      color: Colors.amber,
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Quick Actions",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              FadeInUp(
                delay: const Duration(milliseconds: 600),
                child: Row(
                  children: [

                    QuickActionCard(
                      icon: Icons.car_repair,
                      title: "Booking",
                      color: Colors.blue,
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookingPage(
                              userId: widget.userId,
                            ),
                          ),
                        );

                        if (result == true) {
                          Navigator.pop(context, true);
                          loadDashboard();
                        }
                      },
                    ),

                    const SizedBox(width: 15),

                    QuickActionCard(
                      icon: Icons.location_on,
                      title: "Tracking",
                      color: Colors.orange,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TrackingPage(
                              userId: widget.userId,
                            ),
                          ),
                        );
                      },
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 15),

              FadeInUp(
                delay: const Duration(milliseconds: 800),
                child: Row(
                  children: [

                    QuickActionCard(
                      icon: Icons.history,
                      title: "History",
                      color: Colors.green,
                      onTap: () {},
                    ),

                    const SizedBox(width: 15),

                    QuickActionCard(
                      icon: Icons.person,
                      title: "Profile",
                      color: Colors.purple,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProfilePage(
                              userId: widget.userId,
                              username: widget.username,
                              role: widget.role,
                            ),
                          ),
                        );
                      },
                    ),

                    if (widget.role == "admin") ...[
                      const SizedBox(height: 15),

                      QuickActionCard(
                        icon: Icons.admin_panel_settings,
                        title: "Admin",
                        color: Colors.red,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AdminBookingPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 30),

              ZoomIn(
                delay: const Duration(milliseconds: 1000),
                child: const PromoCard(),
              ),

              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Booking Terakhir",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              FadeInUp(
                delay: const Duration(milliseconds: 1200),
                child: const HistoryCard(),
              ),

            ],
          ),
        );
      },
    );
  }
}