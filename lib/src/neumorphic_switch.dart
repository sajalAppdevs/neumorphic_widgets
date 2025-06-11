import 'package:flutter/material.dart';
import 'package:neumorphic_widgets/src/unpressed_shadows.dart';

class NeumorphicSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;
  final Color backgroundColor;
  final Duration duration;

  const NeumorphicSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.width = 60,
    this.height = 30,
    this.backgroundColor = const Color(0xFFE0E5EC),
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<NeumorphicSwitch> createState() => _NeumorphicSwitchState();
}

class _NeumorphicSwitchState extends State<NeumorphicSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  void _toggleSwitch() {
    setState(() {
      _value = !_value;
    });
    widget.onChanged(_value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: AnimatedContainer(
        duration: widget.duration,
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: _value
              ? pressedShadows
              : unpressedShadows,
        ),
        child: AnimatedAlign(
          duration: widget.duration,
          alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: widget.height - 8,
            height: widget.height - 8,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              shape: BoxShape.circle,
              boxShadow: innerShadows,
            ),
          ),
        ),
      ),
    );
  }
}
