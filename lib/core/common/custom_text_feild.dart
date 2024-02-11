import 'package:flutter/material.dart';
class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({super.key, required this.hint, required this.secure, required this.icon});
  final String hint;
  final bool secure;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none),
        fillColor: Colors.white70,
        filled: true,
        prefixIcon: icon
      ),
      obscureText: secure,
    );
  }
}
