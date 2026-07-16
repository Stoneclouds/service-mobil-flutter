import 'package:flutter/material.dart';

class SuccessDialog {

  static show(
    BuildContext context,
    String title,
    String message,
  ){

    showDialog(

      context: context,

      builder: (_){

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: Row(

            children: const [

              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),

              SizedBox(width:10),

              Text("Success"),

            ],

          ),

          content: Text(message),

          actions: [

            TextButton(

              onPressed: (){
                Navigator.pop(context);
              },

              child: const Text("OK"),

            )

          ],

        );

      },

    );

  }

}