import 'package:flutter/material.dart';

class NeumorphicRippleEffect extends StatefulWidget {
  final double size;
  final Color color;
  final Widget child;
  final Duration duration;
  final VoidCallback? onTap;

  const NeumorphicRippleEffect({
    super.key,
    required this.child,
    this.size = 120,
    this.color = const Color(0xFFE0E0E0),
    this.duration = const Duration(milliseconds: 400),
    this.onTap,
  });

  @override
  State<NeumorphicRippleEffect> createState() => _NeumorphicRippleEffectState();
}

class _NeumorphicRippleEffectState extends State<NeumorphicRippleEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rippleScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _rippleScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  void _triggerRipple() {
    _controller
      ..reset()
      ..forward();
    if (widget.onTap != null) widget.onTap!();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  BoxDecoration _neumorphicDecoration() {
    return BoxDecoration(
      color: widget.color,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.7),
          offset: const Offset(-4, -4),
          blurRadius: 8,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          offset: const Offset(4, 4),
          blurRadius: 8,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _triggerRipple,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                width: widget.size * _rippleScale.value,
                height: widget.size * _rippleScale.value,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.3 * (1 - _rippleScale.value)),
                ),
              );
            },
          ),
          Container(
            width: widget.size,
            height: widget.size,
            decoration: _neumorphicDecoration(),
            child: Center(child: widget.child),
          ),
        ],
      ),
    );
  }
}
