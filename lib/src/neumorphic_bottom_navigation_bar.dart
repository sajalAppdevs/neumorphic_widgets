import 'package:flutter/material.dart';

class NeumorphicBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NeumorphicBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  BoxDecoration _neumorphicDecoration(bool isActive) => BoxDecoration(
    color: const Color(0xFFE0E5EC),
    borderRadius: BorderRadius.circular(16),
    boxShadow: isActive
        ? const [
      BoxShadow(
        color: Colors.white,
        offset: Offset(-3, -3),
        blurRadius: 5,
      ),
      BoxShadow(
        color: Color(0xFFA3B1C6),
        offset: Offset(3, 3),
        blurRadius: 5,
      ),
    ]
        : const [
      BoxShadow(
        color: Colors.white,
        offset: Offset(-2, -2),
        blurRadius: 3,
      ),
      BoxShadow(
        color: Color(0xFFA3B1C6),
        offset: Offset(2, 2),
        blurRadius: 3,
      ),
    ],
  );

  Widget _buildNavItem(IconData icon, String label, int index, bool isActive) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: _neumorphicDecoration(isActive),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: isActive ? Colors.blue : Colors.grey),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isActive ? Colors.blue : Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE0E5EC),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          _buildNavItem(Icons.home, 'Home', 0, currentIndex == 0),
          _buildNavItem(Icons.search, 'Search', 1, currentIndex == 1),
          _buildNavItem(Icons.person, 'Profile', 2, currentIndex == 2),
        ],
      ),
    );
  }
}
