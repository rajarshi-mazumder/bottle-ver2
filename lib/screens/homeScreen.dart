import 'package:bottle_ver2/sharedWidgets/navbar.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      appBar: NavBar(),
      body: Row(
        children: [
          NavigationRail(
            minWidth: 300,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(CupertinoIcons.home), label: Text("Home")),
              NavigationRailDestination(
                  icon: Icon(CupertinoIcons.game_controller_solid),
                  label: Text("Gamer Profile")),
            ],
            selectedIndex: selectedIndex,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
