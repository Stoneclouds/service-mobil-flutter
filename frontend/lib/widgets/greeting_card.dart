import 'package:flutter/material.dart';

class GreetingCard extends StatelessWidget {

  final String username;

  const GreetingCard({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        gradient: const LinearGradient(

          colors: [
            Color(0xff2196F3),
            Color(0xff42A5F5),
          ],

        ),

        borderRadius: BorderRadius.circular(25),

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(

            "Halo, $username 👋",

            style: const TextStyle(

              color: Colors.white,

              fontSize: 24,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 8),

          const Text(

            "Selamat datang kembali.",

            style: TextStyle(

              color: Colors.white70,

            ),

          ),

        ],

      ),

    );

  }

}