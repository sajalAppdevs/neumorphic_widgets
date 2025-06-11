import 'package:flutter/material.dart';

class NeumorphicDrawer extends StatelessWidget {
  const NeumorphicDrawer({super.key});

  BoxDecoration get _neumorphicBoxDecoration => BoxDecoration(
    color: const Color(0xFFE0E5EC),
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Colors.white,
        offset: Offset(-4, -4),
        blurRadius: 6,
      ),
      BoxShadow(
        color: Color(0xFFA3B1C6),
        offset: Offset(4, 4),
        blurRadius: 6,
      ),
    ],
  );

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: _neumorphicBoxDecoration,
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[700]),
        title: Text(title, style: TextStyle(color: Colors.grey[800])),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFE0E5EC),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: _neumorphicBoxDecoration,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "John Doe",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.home, "Home", () {
              Navigator.pop(context);
            }),
            _buildDrawerItem(Icons.settings, "Settings", () {
              Navigator.pop(context);
            }),
            _buildDrawerItem(Icons.info, "About", () {
              Navigator.pop(context);
            }),
            const Spacer(),
            _buildDrawerItem(Icons.logout, "Logout", () {
              Navigator.pop(context);
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
