import 'package:flutter/material.dart';

import '../services/session_service.dart';
import 'home_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

Future<void> checkLogin() async {
  final session = SessionService();

  final isLogin = await session.isLogin();

  if (!mounted) return;

  if (isLogin) {
    final id = await session.getUserId();
    final username = await session.getUsername();
    final role = await session.getRole();

    if (id != null && username != null && role != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(
            userId: id,
            username: username,
            role: role,
          ),
        ),
      );
    } else {
      // Jika data session tidak lengkap
      await session.logout();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ),
      );
    }
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );

  }

}