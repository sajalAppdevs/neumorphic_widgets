import 'package:flutter/cupertino.dart';

import 'neumorphic_toggle.dart';

class ToggleExample extends StatelessWidget {
  const ToggleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NeumorphicToggle(
        initialValue: false,
        onChanged: (value) {
          debugPrint('Toggled: $value');
        },
      ),
    );
  }
}
