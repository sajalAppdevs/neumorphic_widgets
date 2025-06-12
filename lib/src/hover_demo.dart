import 'package:flutter/cupertino.dart';

import 'neumorphic_hover_widget.dart';

class HoverDemo extends StatelessWidget {
  const HoverDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NeumorphicHoverWidget(
        child: const Text(
          'Hover Me!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
