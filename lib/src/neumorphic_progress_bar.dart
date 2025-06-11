import 'package:flutter/material.dart';

class NeumorphicProgressBar extends StatelessWidget {
  final double progress; // between 0.0 to 1.0
  final double height;
  final double width;

  const NeumorphicProgressBar({super.key,
    required this.progress,
    this.height = 30,
    this.width = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(-5, -5),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.grey.shade600,
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: width * progress.clamp(0.0, 1.0),
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade300,
                  Colors.grey.shade500,
                ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Center(
            child: Text(
              '${(progress * 100).toInt()}%',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
