class NeumorphicPulseDemo extends StatelessWidget {
  const NeumorphicPulseDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: Center(
        child: NeumorphicPulse(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.favorite, color: Colors.redAccent, size: 40),
          ),
        ),
      ),
    );
  }
}
