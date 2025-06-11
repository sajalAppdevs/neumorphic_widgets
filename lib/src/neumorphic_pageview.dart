import 'package:flutter/material.dart';

class NeumorphicPageView extends StatefulWidget {
  const NeumorphicPageView({super.key});

  @override
  State<NeumorphicPageView> createState() => _NeumorphicPageViewState();
}

class _NeumorphicPageViewState extends State<NeumorphicPageView> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Color> pageColors = [
    Colors.pink.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView
        Expanded(
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemCount: pageColors.length,
            itemBuilder: (context, index) {
              return Center(
                child: NeumorphicPage(
                  color: pageColors[index],
                  text: 'Page ${index + 1}',
                ),
              );
            },
          ),
        ),

        // Dots indicator
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pageColors.length,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: _currentIndex == index ? 12 : 8,
                height: _currentIndex == index ? 12 : 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? Colors.grey.shade600
                      : Colors.grey.shade400,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NeumorphicPage extends StatelessWidget {
  final Color color;
  final String text;

  const NeumorphicPage({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-8, -8),
            blurRadius: 16,
          ),
          BoxShadow(
            color: Color(0xFFA3B1C6),
            offset: Offset(8, 8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: color.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
