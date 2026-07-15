import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../services/auth_service.dart';
import '../services/session_service.dart';
import 'home_page.dart';
import '../../widgets/error_dialog.dart';

final AuthService authService = AuthService();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final user = TextEditingController();
  final pass = TextEditingController();

  Future<void> login() async {
    try {
      final data = await authService.login(
        user.text.trim(),
        pass.text.trim(),
      );

      if (data["status"] == "success") {
        final userData = data["user"];

        final int userId = int.parse(userData["id"].toString());
        final String username = userData["username"];
        final String role = userData["role"];

        await SessionService().saveLogin(
          id: userId,
          username: username,
          role: role,
        );

        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomePage(
              userId: userId,
              username: username,
              role: role,
            ),
          ),
        );
      } else {
        if (!mounted) return;

        await ErrorDialog.show(

          context,

          title: "Login Gagal",

          message:
              "Username atau Password salah.",

        );
      }
    } catch (e) {
      if (!mounted) return;

      await ErrorDialog.show(

        context,

        title: "Terjadi Kesalahan",

        message:
            "Tidak dapat terhubung ke server.\nSilakan coba beberapa saat lagi.",

      );
    }
  }

  @override
  void dispose() {
    user.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BounceInDown(
                child: const Icon(
                  Icons.car_repair,
                  size: 120,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Car Services",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Booking & Tracking Service Mobil",
              ),

              const SizedBox(height: 30),

              FadeInUp(
                child: TextField(
                  controller: user,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              BounceInUp(
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: login,
                    child: const Text("LOGIN"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}