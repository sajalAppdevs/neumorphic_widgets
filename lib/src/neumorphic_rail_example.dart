import 'package:flutter/material.dart';


class NeumorphicRailExample extends StatefulWidget {
  const NeumorphicRailExample({super.key});

  @override
  State<NeumorphicRailExample> createState() => _NeumorphicRailExampleState();
}

class _NeumorphicRailExampleState extends State<NeumorphicRailExample> {
  int selectedIndex = 0;

  final List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Neumorphic NavigationRail
          Container(
            width: 80,
            color: const Color(0xFFE0E0E0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(icons.length, (index) {
                final isSelected = selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: InkWell(
                    onTap: () {
                      setState(() => selectedIndex = index);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFE0E0E0),
                        boxShadow: isSelected
                            ? [
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 6,
                          ),
                          const BoxShadow(
                            color: Colors.black12,
                            offset: Offset(4, 4),
                            blurRadius: 6,
                          ),
                        ]
                            : [
                          const BoxShadow(
                            color: Colors.black12,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-2, -2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        icons[index],
                        color: isSelected ? Colors.blue : Colors.grey[800],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          // Main Content Area
          Expanded(
            child: Center(
              child: Text(
                'Selected Tab: $selectedIndex',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
