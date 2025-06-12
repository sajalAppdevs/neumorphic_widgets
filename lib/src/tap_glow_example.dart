import 'package:flutter/cupertino.dart';

import 'neumorphic_tap_glow.dart';

class TapGlowExample extends StatelessWidget {
  const TapGlowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NeumorphicTapGlow(
        onTap: () => debugPrint("Tapped!"),
        child: const Text(
          'Tap Me',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
