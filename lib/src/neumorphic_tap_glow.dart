import 'package:flutter/material.dart';

class NeumorphicTapGlow extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final Color backgroundColor;
  final Duration duration;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const NeumorphicTapGlow({
    super.key,
    required this.child,
    this.borderRadius = 16.0,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.duration = const Duration(milliseconds: 200),
    this.padding = const EdgeInsets.all(16),
    this.onTap,
  });

  @override
  State<NeumorphicTapGlow> createState() => _NeumorphicTapGlowState();
}

class _NeumorphicTapGlowState extends State<NeumorphicTapGlow> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    if (widget.onTap != null) widget.onTap!();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: widget.backgroundColor,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      boxShadow: _isPressed
          ? [
        const BoxShadow(
          color: Colors.blueAccent,
          blurRadius: 20,
          spreadRadius: 2,
        ),
      ]
          : [
        const BoxShadow(
          color: Colors.white,
          offset: Offset(-4, -4),
          blurRadius: 8,
        ),
        const BoxShadow(
          color: Colors.black26,
          offset: Offset(4, 4),
          blurRadius: 8,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedContainer(
        duration: widget.duration,
        padding: widget.padding,
        decoration: _buildBoxDecoration(),
        child: widget.child,
      ),
    );
  }
}
