import 'package:flutter/material.dart';

class NeumorphicAnimatedContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;
  final Duration duration;
  final Curve curve;
  final bool isPressed;
  final BorderRadius borderRadius;
  final Color color;

  const NeumorphicAnimatedContainer({
    super.key,
    this.width = 200,
    this.height = 100,
    this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.isPressed = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.color = const Color(0xFFE0E0E0),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      curve: curve,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        boxShadow: isPressed
            ? [
          // Pressed (inset effect)
          BoxShadow(
            color: Colors.white.withOpacity(0.7),
            offset: const Offset(-2, -2),
            blurRadius: 6,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(2, 2),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ]
            : [
          // Unpressed (raised effect)
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            offset: const Offset(-6, -6),
            blurRadius: 16,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(6, 6),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
