import 'package:flutter/material.dart';

import '../dashboard/dashboard_page.dart';

class AdminPage extends StatelessWidget {
  final String username;

  const AdminPage({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Dashboard(
      username: username,
      role: "admin",
    );
  }
}