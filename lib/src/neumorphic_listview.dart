import 'package:flutter/material.dart';

class NeumorphicListView extends StatelessWidget {
  final List<String> items;

  const NeumorphicListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Allow nesting in ScrollView
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return NeumorphicListItem(title: items[index]);
      },
    );
  }
}

class NeumorphicListItem extends StatelessWidget {
  final String title;

  const NeumorphicListItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-5, -5),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Color(0xFFA3B1C6),
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
