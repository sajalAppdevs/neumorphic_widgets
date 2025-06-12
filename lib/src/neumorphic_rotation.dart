import 'package:flutter/material.dart';

class NeumorphicRotation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool rotateClockwise;
  final double angle; // in turns, e.g. 1.0 = full rotation
  final Color color;
  final BorderRadius borderRadius;

  const NeumorphicRotation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.rotateClockwise = true,
    this.angle = 1.0,
    this.color = const Color(0xFFE0E0E0),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  State<NeumorphicRotation> createState() => _NeumorphicRotationState();
}

class _NeumorphicRotationState extends State<NeumorphicRotation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.rotateClockwise ? widget.angle : -widget.angle,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  BoxDecoration _neumorphicDecoration() {
    return BoxDecoration(
      color: widget.color,
      borderRadius: widget.borderRadius,
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.8),
          offset: const Offset(-6, -6),
          blurRadius: 10,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          offset: const Offset(6, 6),
          blurRadius: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        return Transform.rotate(
          angle: _animation.value * 2 * 3.1415926,
          child: Container(
            decoration: _neumorphicDecoration(),
            padding: const EdgeInsets.all(12),
            child: widget.child,
          ),
        );
      },
    );
  }
}
