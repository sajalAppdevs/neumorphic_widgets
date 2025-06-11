import 'package:flutter/material.dart';
import 'neumorphic_stepper.dart'; // Make sure this import points to your file


class NeumorphicStepperDemo extends StatefulWidget {
  const NeumorphicStepperDemo({super.key});

  @override
  State<NeumorphicStepperDemo> createState() => _NeumorphicStepperDemoState();
}

class _NeumorphicStepperDemoState extends State<NeumorphicStepperDemo> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Neumorphic Stepper")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeumorphicStepper(
            steps: 4,
            currentStep: currentStep,
            onStepTapped: (index) {
              setState(() {
                currentStep = index;
              });
            },
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (currentStep < 3) currentStep++;
              });
            },
            child: const Text("Next"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (currentStep > 0) currentStep--;
              });
            },
            child: const Text("Previous"),
          ),
        ],
      ),
    );
  }
}
