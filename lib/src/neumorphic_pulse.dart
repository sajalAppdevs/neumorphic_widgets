import 'package:flutter/material.dart';

class NeumorphicPulse extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scale;

  const NeumorphicPulse({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.scale = 1.05,
  });

  @override
  State<NeumorphicPulse> createState() => _NeumorphicPulseState();
}

class _NeumorphicPulseState extends State<NeumorphicPulse>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _shadowBlur;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 1.0,
      end: widget.scale,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _shadowBlur = Tween<double>(
      begin: 6,
      end: 12,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Transform.scale(
          scale: _animation.value,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  offset: const Offset(-4, -4),
                  blurRadius: _shadowBlur.value,
                ),
                BoxShadow(
                  color: Colors.black26,
                  offset: const Offset(4, 4),
                  blurRadius: _shadowBlur.value,
                ),
              ],
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
