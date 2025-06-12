import 'package:flutter/material.dart';

import 'neumorphic_ripple_effect.dart';

class RippleDemo extends StatelessWidget {
  const RippleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NeumorphicRippleEffect(
        child: const Icon(Icons.play_arrow, size: 40),
        onTap: () {
          debugPrint("Ripple tapped!");
        },
      ),
    );
  }
}
