import 'package:flutter/material.dart';

class NeumorphicUtils {
  static List<BoxShadow> getNeumorphicShadows({
    required Color color,
    double depth = 8,
    bool isConcave = false,
  }) {
    final highlight = isConcave ? Colors.black12 : Colors.white;
    final shadow = isConcave ? Colors.white : Colors.black26;

    return [
      BoxShadow(
        color: highlight,
        offset: Offset(-depth / 2, -depth / 2),
        blurRadius: depth,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: shadow,
        offset: Offset(depth / 2, depth / 2),
        blurRadius: depth,
        spreadRadius: 1,
      ),
    ];
  }
}
