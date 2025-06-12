import 'package:flutter/material.dart';

class NeumorphicDivider extends StatelessWidget {
  final double thickness;
  final double indent;
  final double endIndent;
  final Color color;
  final double blurRadius;
  final double spreadRadius;

  const NeumorphicDivider({
    super.key,
    this.thickness = 2.0,
    this.indent = 16.0,
    this.endIndent = 16.0,
    this.color = const Color(0xFFE0E0E0),
    this.blurRadius = 4.0,
    this.spreadRadius = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: indent, right: endIndent),
      child: Container(
        height: thickness,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(thickness),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: const Offset(-1, -1),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(1, 1),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
            ),
          ],
        ),
      ),
    );
  }
}
