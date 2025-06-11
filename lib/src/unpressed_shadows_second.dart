import 'package:flutter/material.dart';

const List<BoxShadow> unpressedShadows = [
  BoxShadow(
    color: Colors.white,
    offset: Offset(-4, -4),
    blurRadius: 8,
  ),
  BoxShadow(
    color: Color(0xFFA3B1C6),
    offset: Offset(4, 4),
    blurRadius: 8,
  ),
];

const List<BoxShadow> pressedShadows = [
  BoxShadow(
    color: Color(0xFFA3B1C6),
    offset: Offset(-2, -2),
    blurRadius: 6,
  ),
  BoxShadow(
    color: Colors.white,
    offset: Offset(2, 2),
    blurRadius: 6,
  ),
];
