import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dashboard_page.dart';
import 'package:animate_do/animate_do.dart';
import '../services/auth_service.dart';
final AuthService authService = AuthService();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final user = TextEditingController();
  final pass = TextEditingController();

  void login() async {

    try {

      var data = await authService.login(
        user.text,
        pass.text,
      );

      if (data["status"] == "success") {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Dashboard(
              username: data["user"]["username"],
              role: data["user"]["role"],
            ),
          ),
        );

      } else {

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Username atau Password salah"),
          ),
        );

      }

    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );

    }

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