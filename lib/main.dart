import 'package:flutter/material.dart';
import 'constants/app_theme.dart';
import 'pages/login_page.dart';
import 'pages/admin/admin_booking_page.dart';
import 'pages/admin/admin_user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        "/admin-booking": (_) => const AdminBookingPage(),
        "/admin-users": (_) => const AdminUserPage(),
      },
      debugShowCheckedModeBanner: false,

      title: "AutoCare+",

      theme: AppTheme.lightTheme,

      home: const LoginPage(),

    );

  }
}