import 'package:flutter/material.dart';

class NeumorphicGrid extends StatelessWidget {
  final int itemCount;

  const NeumorphicGrid({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust column count
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return NeumorphicGridItem(index: index);
      },
    );
  }
}

class NeumorphicGridItem extends StatelessWidget {
  final int index;

  const NeumorphicGridItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-6, -6),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Color(0xFFA3B1C6),
            offset: Offset(6, 6),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: Text(
          "Item ${index + 1}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
