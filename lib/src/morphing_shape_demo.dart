class MorphingShapeDemo extends StatelessWidget {
  const MorphingShapeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: const Center(
        child: NeumorphicMorphingShape(),
      ),
    );
  }
}
