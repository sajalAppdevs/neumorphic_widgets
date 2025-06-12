import 'package:flutter/material.dart';

import 'neumorphic_fade_animation.dart';

class NeumorphicFadeDemo extends StatelessWidget {
  const NeumorphicFadeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NeumorphicFadeAnimation(
        duration: const Duration(seconds: 3),
        child: const Icon(Icons.favorite, size: 48, color: Colors.pink),
      ),
    );
  }
}
