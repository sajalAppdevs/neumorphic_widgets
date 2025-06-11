import 'package:flutter/material.dart';

class NeumorphicStepper extends StatefulWidget {
  final int steps;
  final int currentStep;
  final ValueChanged<int> onStepTapped;

  const NeumorphicStepper({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.onStepTapped,
  });

  @override
  State<NeumorphicStepper> createState() => _NeumorphicStepperState();
}

class _NeumorphicStepperState extends State<NeumorphicStepper> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.steps * 2 - 1, (index) {
        if (index.isEven) {
          final stepIndex = index ~/ 2;
          final isActive = stepIndex == widget.currentStep;
          final isCompleted = stepIndex < widget.currentStep;

          return InkWell(
            onTap: () => widget.onStepTapped(stepIndex),
            child: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFFE0E0E0)
                    : const Color(0xFFF0F0F0),
                shape: BoxShape.circle,
                boxShadow: isActive
                    ? [
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-3, -3),
                    blurRadius: 6,
                  ),
                  const BoxShadow(
                    color: Colors.black12,
                    offset: Offset(3, 3),
                    blurRadius: 6,
                  ),
                ]
                    : [
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-2, -2),
                    blurRadius: 3,
                  ),
                  const BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2, 2),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '${stepIndex + 1}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isCompleted
                        ? Colors.green
                        : isActive
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container(
            width: 40,
            height: 4,
            color: widget.currentStep > (index ~/ 2)
                ? Colors.green
                : Colors.grey[300],
          );
        }
      }),
    );
  }
}
