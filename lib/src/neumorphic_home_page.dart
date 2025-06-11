import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_widgets/src/neumorphic_grid.dart';

import '../neumorphic_widgets.dart';
import 'neumorphic_drawer.dart';
import 'neumorphic_expansion_tile.dart';
import 'neumorphic_listview.dart';
import 'neumorphic_pageview.dart';
import 'neumorphic_tab_bar.dart';

class NeumorphicHomePage extends StatefulWidget {
  const NeumorphicHomePage({super.key});

  @override
  State<NeumorphicHomePage> createState() => _NeumorphicHomePageState();
}

class _NeumorphicHomePageState extends State<NeumorphicHomePage> {
  bool isOn = false;
  bool isChecked = false;
  String selected = "A";
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // You can adjust height as needed
        child: NeumorphicAppBar(title: "Neumorphic UI"),
      ),
      drawer: const NeumorphicDrawer(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                NeumorphicTextField(
                  controller: _controller,
                  hintText: "Enter text here...",
                  prefixIcon: Icons.edit,
                ),
                const SizedBox(height: 20),
                NeumorphicButton(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("Submit", style: TextStyle(fontSize: 16)),
                  ),
                  onPressed: () {
                    final text = _controller.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("You typed: $text")),
                    );
                  },
                ),
                const SizedBox(height: 20),
                NeumorphicContainer(
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "This is a Neumorphic Container",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                NeumorphicButton(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Tap Me",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Neumorphic Button Pressed!")),
                    );
                  },
                ),
                const SizedBox(height: 20),
                NeumorphicCard(
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "This is a Neumorphic Card",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                NeumorphicSwitch(
                  value: isOn,
                  onChanged: (newValue) {
                    setState(() {
                      isOn = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),
                NeumorphicCheckbox(
                  value: isChecked,
                  onChanged: (val) {
                    setState(() {
                      isChecked = val;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NeumorphicRadioButton<String>(
                      value: "A",
                      groupValue: selected,
                      onChanged: (val) {
                        setState(() => selected = val);
                      },
                    ),
                    const SizedBox(width: 20),
                    NeumorphicRadioButton<String>(
                      value: "B",
                      groupValue: selected,
                      onChanged: (val) {
                        setState(() => selected = val);
                      },
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                NeumorphicProgressBar(
                  progress: 0.65,
                ),
                NeumorphicIconButton(
                  icon: Icons.favorite,
                  onTap: () {
                    if (kDebugMode) {
                      print("Icon tapped!");
                    }
                  },
                ),
                NeumorphicToggleButton(),
                NeumorphicGrid(itemCount: 6),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200, // Adjust the height as needed
                  child: NeumorphicPageView(),
                ),
                NeumorphicListView(
                  items: [
                    "Profile",
                    "Settings",
                    "Notifications",
                    "Privacy",
                    "Logout",
                  ],
                ),
                NeumorphicExpansionTile(
                  title: "More Options",
                  children: const [
                    ListTile(title: Text("Option 1")),
                    ListTile(title: Text("Option 2")),
                    ListTile(title: Text("Option 3")),
                  ],
                ),
                NeumorphicTabBar(
                  tabs: const ["Home", "Profile", "Settings"],
                  tabViews: const [
                    Center(child: Text("Home Content")),
                    Center(child: Text("Profile Content")),
                    Center(child: Text("Settings Content")),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
