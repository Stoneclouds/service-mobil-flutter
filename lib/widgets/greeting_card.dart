import 'package:flutter/material.dart';
import '../constants/app_color.dart'; 

class GreetingCard extends StatelessWidget {
  final String username;

  const GreetingCard({
    super.key,
    required this.username,
  });

  String getGreeting() {
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return "Good Morning ☀";
  } else if (hour < 17) {
    return "Good Afternoon 🌤";
  } else {
    return "Good Evening 🌙";
  }
}
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColor.primary,
            AppColor.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(25),
      ),

      child: Row(
        children: [

          const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: AppColor.primary,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  getGreeting(),
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Premium Member",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),

          const Icon(
            Icons.notifications_none,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}