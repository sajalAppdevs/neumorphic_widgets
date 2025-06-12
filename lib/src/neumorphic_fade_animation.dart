import 'package:flutter/material.dart';

class NeumorphicFadeAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool repeat;
  final Color color;
  final BorderRadius borderRadius;

  const NeumorphicFadeAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.repeat = true,
    this.color = const Color(0xFFE0E0E0),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  State<NeumorphicFadeAnimation> createState() => _NeumorphicFadeAnimationState();
}

class _NeumorphicFadeAnimationState extends State<NeumorphicFadeAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.repeat) {
      _controller.repeat(reverse: true);
    } else {
      _controller.forward();
    }
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
          offset: const Offset(-4, -4),
          blurRadius: 8,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(4, 4),
          blurRadius: 8,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        decoration: _neumorphicDecoration(),
        padding: const EdgeInsets.all(12),
        child: widget.child,
      ),
    );
  }
}
