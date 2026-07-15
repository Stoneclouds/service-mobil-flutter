import 'package:flutter/material.dart';

class SuccessDialog {

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
  }) {

    return showDialog(

      context: context,

      barrierDismissible: false,

      builder: (_) {

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          content: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              const CircleAvatar(

                radius: 35,

                backgroundColor: Colors.green,

                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 40,
                ),

              ),

              const SizedBox(height: 20),

              Text(

                title,

                style: const TextStyle(

                  fontSize: 22,
                  fontWeight: FontWeight.bold,

                ),

              ),

              const SizedBox(height: 10),

              Text(

                message,

                textAlign: TextAlign.center,

              ),

              const SizedBox(height: 25),

              SizedBox(

                width: double.infinity,

                child: ElevatedButton(

                  onPressed: () {

                    Navigator.pop(context);

                  },

                  child: const Text("OK"),

                ),

              ),

            ],

          ),

        );

      },

    );

  }

}