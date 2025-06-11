import 'package:flutter/material.dart';
import 'neumorphic_utils.dart';

class NeumorphicCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color? color;
  final double depth;
  final bool isConcave;

  const NeumorphicCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 16,
    this.color,
    this.depth = 8,
    this.isConcave = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = color ?? Theme.of(context).scaffoldBackgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: NeumorphicUtils.getNeumorphicShadows(
          color: backgroundColor,
          depth: depth,
          isConcave: isConcave,
        ),
      ),
      padding: padding,
      child: child,
    );
  }
}
