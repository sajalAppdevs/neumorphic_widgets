import 'package:flutter/material.dart';


class NeumorphicIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color iconColor;

  const NeumorphicIconButton({super.key,
    required this.icon,
    required this.onTap,
    this.size = 60.0,
    this.backgroundColor = const Color(0xFFE0E5EC),
    this.iconColor = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            // Light shadow on top-left
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 8,
            ),
            // Dark shadow on bottom-right
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(4, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: size * 0.5,
          ),
        ),
      ),
    );
  }
}
