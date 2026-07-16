import 'package:flutter/material.dart';

class ErrorDialog {

  static show(
      BuildContext context,
      String message,
      ){

    showDialog(

      context: context,

      builder: (_){

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: const Row(

            children: [

              Icon(
                Icons.error,
                color: Colors.red,
              ),

              SizedBox(width:10),

              Text("Error"),

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