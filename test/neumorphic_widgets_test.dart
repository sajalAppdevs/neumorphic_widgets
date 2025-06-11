import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_widgets/neumorphic_widgets.dart';

void main() {
  testWidgets('NeumorphicButton triggers callback', (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: NeumorphicButton(
          onPressed: () => tapped = true,
          child: const Text('Click'),
        ),
      ),
    );

    await tester.tap(find.text('Click'));
    expect(tapped, isTrue);
  });
}
