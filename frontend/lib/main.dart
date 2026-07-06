import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dashboard.dart';
import 'package:animate_do/animate_do.dart';

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
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final user = TextEditingController();
  final pass = TextEditingController();

  void login() async {

    var res = await http.post(
      Uri.parse(
        "http://192.168.18.167/servis_mobile/api/login.php",
      ),
      body: {
        "username": user.text,
        "password": pass.text,
      },
    );

    var data = json.decode(res.body);

    if(data["status"] == "success"){

      String username = data["user"]["username"];
      String role = data["user"]["role"];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Dashboard(
            username: username,
            role: role,
          ),
        ),
      );

    }else{

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login gagal"),
        ),
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