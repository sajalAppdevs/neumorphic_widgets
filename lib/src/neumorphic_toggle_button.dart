import 'package:flutter/material.dart';

class NeumorphicToggleButton extends StatefulWidget {
  const NeumorphicToggleButton({super.key});

  @override
  State<NeumorphicToggleButton> createState() => _NeumorphicToggleButtonState();
}

class _NeumorphicToggleButtonState extends State<NeumorphicToggleButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final double size = 80.0;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Color(0xFFE0E5EC),
          shape: BoxShape.circle,
          boxShadow: isPressed
              ? [
            // Inner shadows (simulate pressed-in effect)
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(2, 2),
              blurRadius: 6,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.7),
              offset: Offset(-2, -2),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ]
              : [
            // Outer shadows (default neumorphic raised effect)
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5, -5),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(5, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            isPressed ? Icons.toggle_on : Icons.toggle_off,
            size: size * 0.6,
            color: isPressed ? Colors.green : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
