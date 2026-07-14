import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscureText;

  const PrimaryTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(

      controller: controller,

      obscureText: obscureText,

      decoration: InputDecoration(

        prefixIcon: Icon(icon),

        hintText: hint,

        filled: true,

        fillColor: Colors.grey.shade100,

        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(15),

          borderSide: BorderSide.none,

        ),

      ),

    );
  }
} 