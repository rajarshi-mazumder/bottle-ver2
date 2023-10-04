import 'dart:math';
import 'dart:ui';

import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileLeftSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileRightSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileTopSection.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';

import '../sharedWidgets/rightSidebar.dart';
import '../sharedWidgets/sidebar.dart';

class GameProfileScreen extends StatefulWidget {
  const GameProfileScreen({Key? key});

  @override
  State<GameProfileScreen> createState() => _GameProfileScreenState();
}

class _GameProfileScreenState extends State<GameProfileScreen> {
  bool _isBlueContainerSticky = false;
  bool isSidebarExpanded = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 600,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "/fade5_1_bw.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [bgPrimaryColor, bgSecondaryColor])),
            child: Stack(children: [
              Positioned(
                  top: 50,
                  left: 0,
                  child: Sidebar(isExpanded: isSidebarExpanded)),
              Positioned(
                  top: 50,
                  right: 0,
                  child: RightSidebar(isExpanded: isSidebarExpanded)),
            ]),
          ),
        )
      ],
    );
  }
}
