import 'package:flutter/cupertino.dart';

import 'neumorphic_animated_container.dart';

class NeumorphicDemo extends StatefulWidget {
  const NeumorphicDemo({super.key});

  @override
  State<NeumorphicDemo> createState() => _NeumorphicDemoState();
}

class _NeumorphicDemoState extends State<NeumorphicDemo> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      child: NeumorphicAnimatedContainer(
        isPressed: isPressed,
        child: const Center(
          child: Text("Tap Me", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
