import 'package:flutter/material.dart';
import 'package:neumorphic_widgets/src/unpressed_shadows.dart';
import 'utils.dart';

class NeumorphicRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double size;
  final Color backgroundColor;
  final Duration duration;

  const NeumorphicRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.size = 40.0,
    this.backgroundColor = const Color(0xFFE0E5EC),
    this.duration = const Duration(milliseconds: 200),
  });

  bool get _isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: AnimatedContainer(
        duration: duration,
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          boxShadow: _isSelected ? pressedShadows : unpressedShadows,
        ),
        child: Center(
          child: AnimatedContainer(
            duration: duration,
            width: size * 0.5,
            height: size * 0.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isSelected ? Colors.blueAccent : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
