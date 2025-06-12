import 'package:flutter/material.dart';

class NeumorphicSlideTransition extends StatefulWidget {
  final Widget child;
  final Offset beginOffset;
  final Offset endOffset;
  final Duration duration;
  final bool repeat;
  final Color color;
  final BorderRadius borderRadius;

  const NeumorphicSlideTransition({
    super.key,
    required this.child,
    this.beginOffset = const Offset(-1, 0),
    this.endOffset = Offset.zero,
    this.duration = const Duration(seconds: 2),
    this.repeat = true,
    this.color = const Color(0xFFE0E0E0),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  State<NeumorphicSlideTransition> createState() =>
      _NeumorphicSlideTransitionState();
}

class _NeumorphicSlideTransitionState extends State<NeumorphicSlideTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: widget.beginOffset,
      end: widget.endOffset,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

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
    return SlideTransition(
      position: _animation,
      child: Container(
        decoration: _neumorphicDecoration(),
        padding: const EdgeInsets.all(12),
        child: widget.child,
      ),
    );
  }
}
