import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileLeftSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileRightSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileTopSection.dart';
import 'package:flutter/material.dart';

class GameProfileScreen extends StatefulWidget {
  const GameProfileScreen({super.key});

  @override
  State<GameProfileScreen> createState() => _GameProfileScreenState();
}

class _GameProfileScreenState extends State<GameProfileScreen> {
  int _selectedTabIndex = 0; // Track the selected tab index

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      animationDuration: Duration.zero, // Number of tabs
      initialIndex: 0, // Initial selected tab index
      child: Scaffold(
        appBar: GameProfileTopSection(
          tabBar: TabBar(

            tabs: [
              Tab(text: 'Game Profiles'), // Tab 1 text
              Tab(text: 'Posts'), // Tab 2 text
              Tab(text: 'Communities'), // Tab 3 text
            ],
            onTap: (index) {
              setState(() {
                _selectedTabIndex = index; // Update selected tab index
              });
            },

          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                // Content for Tab 1
                _buildTabContent(0),
                // Content for Tab 2
                _buildTabContent(1),
                // Content for Tab 3
                _buildTabContent(2),
              ],
            ),
            Positioned(
              top: 20,
              left: 350,
              child: GameProfileLeftSection(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build tab content based on the selected index
  Widget _buildTabContent(int tabIndex) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (tabIndex == _selectedTabIndex)
              Container(
                width: 900,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 200, top: 70),
                          child: GameProfileRightSection(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
