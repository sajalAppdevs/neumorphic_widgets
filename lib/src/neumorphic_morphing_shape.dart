import 'package:flutter/material.dart';

class NeumorphicMorphingShape extends StatefulWidget {
  final Duration duration;
  final double size;

  const NeumorphicMorphingShape({
    super.key,
    this.duration = const Duration(seconds: 2),
    this.size = 120.0,
  });

  @override
  State<NeumorphicMorphingShape> createState() => _NeumorphicMorphingShapeState();
}

class _NeumorphicMorphingShapeState extends State<NeumorphicMorphingShape>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _radiusAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: widget.size / 2), weight: 1),   // Square to Circle
      TweenSequenceItem(tween: Tween(begin: widget.size / 2, end: 16.0), weight: 1), // Circle to Rounded
      TweenSequenceItem(tween: Tween(begin: 16.0, end: 0.0), weight: 1),             // Rounded to Square
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _radiusAnim,
      builder: (_, __) {
        return Container(
          height: widget.size,
          width: widget.size,
          decoration: BoxDecoration(
            color: const Color(0xFFE0E0E0),
            borderRadius: BorderRadius.circular(_radiusAnim.value),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                offset: Offset(-6, -6),
                blurRadius: 12,
              ),
              BoxShadow(
                color: Colors.black26,
                offset: Offset(6, 6),
                blurRadius: 12,
              ),
            ],
          ),
        );
      },
    );
  }
}
