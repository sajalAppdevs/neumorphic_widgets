import 'package:flutter/material.dart';

BoxDecoration neumorphicDecoration({
  required bool isPressed,
  required Color color,
  double borderRadius = 12.0,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: isPressed
        ? [
      BoxShadow(
        offset: const Offset(2, 2),
        color: Colors.black.withOpacity(0.2),
        blurRadius: 6,
      ),
      BoxShadow(
        offset: const Offset(-2, -2),
        color: Colors.white.withOpacity(0.7),
        blurRadius: 6,
      ),
    ]
        : [
      BoxShadow(
        offset: const Offset(-6, -6),
        color: Colors.white.withOpacity(0.8),
        blurRadius: 10,
      ),
      BoxShadow(
        offset: const Offset(6, 6),
        color: Colors.black.withOpacity(0.2),
        blurRadius: 10,
      ),
    ],
  );
}
