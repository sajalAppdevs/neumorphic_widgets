import 'package:flutter/material.dart';

class NeumorphicTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;

  const NeumorphicTextField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.prefixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFFFFFFF),
            offset: Offset(-5, -5),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Color(0xFFA3B1C6),
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          icon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey[700]) : null,
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
