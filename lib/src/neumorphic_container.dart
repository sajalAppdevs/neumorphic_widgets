import 'package:flutter/material.dart';
import 'utils.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final EdgeInsets padding;

  const NeumorphicContainer({
    super.key,
    required this.child,
    this.color = const Color(0xFFE0E5EC),
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: neumorphicDecoration(
        isPressed: false,
        color: color,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
