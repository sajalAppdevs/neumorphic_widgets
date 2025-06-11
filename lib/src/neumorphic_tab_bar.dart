import 'package:flutter/material.dart';

class NeumorphicTabBar extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> tabViews;

  const NeumorphicTabBar({
    super.key,
    required this.tabs,
    required this.tabViews,
  });

  @override
  State<NeumorphicTabBar> createState() => _NeumorphicTabBarState();
}

class _NeumorphicTabBarState extends State<NeumorphicTabBar> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  BoxDecoration _neumorphicDecoration(bool isSelected) {
    return BoxDecoration(
      color: const Color(0xFFE0E5EC),
      borderRadius: BorderRadius.circular(12),
      boxShadow: isSelected
          ? const [
        BoxShadow(color: Colors.white, offset: Offset(-4, -4), blurRadius: 6),
        BoxShadow(color: Color(0xFFA3B1C6), offset: Offset(4, 4), blurRadius: 6),
      ]
          : const [
        BoxShadow(color: Colors.white, offset: Offset(4, 4), blurRadius: 4),
        BoxShadow(color: Color(0xFFA3B1C6), offset: Offset(-4, -4), blurRadius: 4),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Custom Neumorphic TabBar
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFE0E5EC),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: List.generate(widget.tabs.length, (index) {
              final isSelected = _controller.index == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    _controller.animateTo(index);
                    setState(() {});
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: _neumorphicDecoration(isSelected),
                    child: Center(
                      child: Text(
                        widget.tabs[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.black : Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        // Tab Views
        SizedBox(
          height: 300,
          child: TabBarView(
            controller: _controller,
            children: widget.tabViews,
          ),
        ),
      ],
    );
  }
}
