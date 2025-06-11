import 'package:flutter/material.dart';
import 'utils.dart';

class NeumorphicButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;

  const NeumorphicButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.color = const Color(0xFFE0E5EC),
    this.borderRadius = 12.0,
  });

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false;

  void _updatePressed(bool val) => setState(() => _isPressed = val);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _updatePressed(true),
      onTapUp: (_) {
        _updatePressed(false);
        widget.onPressed();
      },
      onTapCancel: () => _updatePressed(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: neumorphicDecoration(
          isPressed: _isPressed,
          color: widget.color,
          borderRadius: widget.borderRadius,
        ),
        padding: const EdgeInsets.all(16),
        child: Center(child: widget.child),
      ),
    );
  }
}
