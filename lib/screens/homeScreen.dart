import 'package:bottle_ver2/sharedWidgets/navbar.dart';
import 'package:bottle_ver2/sharedWidgets/sidebar.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSidebarExpanded = false;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      appBar: NavBar(),
      body: Row(
        children: [
          Sidebar(isExpanded: isSidebarExpanded),

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
