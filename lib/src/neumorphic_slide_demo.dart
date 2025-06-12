import 'package:flutter/material.dart';

import 'neumorphic_slide_transition.dart';

class NeumorphicSlideDemo extends StatelessWidget {
  const NeumorphicSlideDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NeumorphicSlideTransition(
        beginOffset: const Offset(-1.5, 0),
        endOffset: Offset.zero,
        duration: const Duration(seconds: 3),
        child: const Icon(Icons.arrow_forward, size: 48, color: Colors.grey),
      ),
    );
  }
}
