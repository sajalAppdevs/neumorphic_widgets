import 'package:flutter/material.dart';

class NeumorphicHoverWidget extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final Color backgroundColor;
  final EdgeInsets padding;

  const NeumorphicHoverWidget({
    super.key,
    required this.child,
    this.borderRadius = 16.0,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.padding = const EdgeInsets.all(16),
  });

  @override
  State<NeumorphicHoverWidget> createState() => _NeumorphicHoverWidgetState();
}

class _NeumorphicHoverWidgetState extends State<NeumorphicHoverWidget> {
  bool _isHovering = false;

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: widget.backgroundColor,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      boxShadow: _isHovering
          ? [
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
      ]
          : [
        const BoxShadow(
          color: Colors.black12,
          offset: Offset(2, 2),
          blurRadius: 4,
        ),
        const BoxShadow(
          color: Colors.white,
          offset: Offset(-2, -2),
          blurRadius: 4,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: widget.padding,
        decoration: _buildDecoration(),
        child: widget.child,
      ),
    );
  }
}
