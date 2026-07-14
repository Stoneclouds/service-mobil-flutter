import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      width: double.infinity,
      height: 55,

      child: ElevatedButton.icon(

        icon: Icon(icon),

        onPressed: onPressed,

        style: ElevatedButton.styleFrom(

          backgroundColor: Colors.blue,

          foregroundColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

        ),

        label: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

      ),

    );

  }
}