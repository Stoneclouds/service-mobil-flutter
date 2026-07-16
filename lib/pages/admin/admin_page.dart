import 'package:flutter/material.dart';

import '../dashboard/dashboard_page.dart';

class AdminPage extends StatelessWidget {

  final int userId;
  final String username;

  const AdminPage({
    super.key,
    required this.userId,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Dashboard(
      userId: userId,
      username: username,
      role: "admin",
    );
  }
}