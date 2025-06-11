import 'package:flutter/material.dart';
import 'package:neumorphic_widgets/src/unpressed_shadows.dart';

class NeumorphicCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  final Color backgroundColor;
  final Duration duration;

  const NeumorphicCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 40.0,
    this.backgroundColor = const Color(0xFFE0E5EC),
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<NeumorphicCheckbox> createState() => _NeumorphicCheckboxState();
}

class _NeumorphicCheckboxState extends State<NeumorphicCheckbox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  void _toggle() {
    setState(() {
      _value = !_value;
    });
    widget.onChanged(_value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: widget.duration,
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: _value ? pressedShadows : unpressedShadows,
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: widget.duration,
            opacity: _value ? 1.0 : 0.0,
            child: Icon(
              Icons.check,
              color: Colors.green.shade600,
              size: widget.size * 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
