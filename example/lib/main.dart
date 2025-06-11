import 'package:flutter/material.dart';
import 'package:neumorphic_widgets/src/neumorphic_home_page.dart';

void main() => runApp(const NeumorphicDemo());

class NeumorphicDemo extends StatelessWidget {
  const NeumorphicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphic Widgets Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE0E5EC),
        useMaterial3: true,
      ),
      home: const NeumorphicHomePage(),
    );
  }
}

