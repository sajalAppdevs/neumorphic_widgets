import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_widgets/src/neumorphic_grid.dart';

import '../neumorphic_widgets.dart';
import 'neumoprhic_rail.dart';
import 'neumorphic_drawer.dart';
import 'neumorphic_expansion_tile.dart';
import 'neumorphic_listview.dart';
import 'neumorphic_pageview.dart';
import 'neumorphic_tab_bar.dart';
import 'neumorphic_bottom_navigation_bar.dart';


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

  int _selectedIndex = 0;

  final List<IconData> railIcons = [
    Icons.home,
    Icons.search,
    Icons.settings,
  ];

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            NeumorphicProgressBar(progress: 0.65),
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
            SizedBox(height: 200, child: NeumorphicPageView()),
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
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return const Center(child: Text("Search Page"));
      case 2:
        return const Center(child: Text("Profile Page"));
      default:
        return const Center(child: Text("Unknown"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: NeumorphicAppBar(title: "Neumorphic UI"),
      ),
      drawer: const NeumorphicDrawer(),
      body: Row(
        children: [
          /// ✅ Add Neumorphic Rail here
          NeumorphicRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text("Home"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.search),
                label: Text("Search"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text("Profile"),
              ),
            ],
          ),

          /// Expanded content area
          Expanded(child: _buildBody()),
        ],
      ),
      bottomNavigationBar: NeumorphicBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
