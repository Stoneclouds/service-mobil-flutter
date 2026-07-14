import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {

  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 6,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(

        leading: const CircleAvatar(

          child: Icon(Icons.car_repair),

        ),

        title: const Text(

          "Toyota Avanza",

          style: TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),

        subtitle: const Text(

          "Oil Change\n20 Juli 2026",

        ),

        trailing: Container(

          padding: const EdgeInsets.symmetric(

            horizontal: 10,

            vertical: 5,

          ),

          decoration: BoxDecoration(

            color: Colors.green,

            borderRadius: BorderRadius.circular(20),

          ),

          child: const Text(

            "Done",

            style: TextStyle(

              color: Colors.white,

            ),

          ),

        ),

      ),

    );

  }

}