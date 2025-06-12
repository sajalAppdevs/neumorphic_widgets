import 'package:flutter/material.dart';

import 'neumorphic_rotation.dart';

class NeumorphicRotationDemo extends StatelessWidget {
  const NeumorphicRotationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NeumorphicRotation(
        duration: const Duration(seconds: 4),
        angle: 1.0,
        child: const Icon(Icons.sync, size: 50, color: Colors.grey),
      ),
    );
  }
}
