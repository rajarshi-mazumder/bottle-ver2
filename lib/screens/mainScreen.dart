import 'dart:math';
import 'dart:ui';

import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileLeftSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileRightSection.dart';
import 'package:bottle_ver2/screens/gameProfileWidgets/gameProfileTopSection.dart';
import 'package:bottle_ver2/screens/gamerProfileScreen.dart';
import 'package:bottle_ver2/sharedWidgets/searchBar.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';

import '../sharedWidgets/rightSidebar.dart';
import '../sharedWidgets/sidebar.dart';

class MainScreenScreen extends StatefulWidget {
  @override
  _MainScreenScreenState createState() => _MainScreenScreenState();
}

class _MainScreenScreenState extends State<MainScreenScreen> {
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
          expandedHeight: 550,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Image.asset(
                  "/omen3.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 200,
                        width: 300,

                        child: Column(
                          children: [
                            Text("VALORANT",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 50)),
                            CustomSearchBar(backgroundColor: bgTertiaryColor),
                          ],
                        ),
                        // Set the color for the blue container
                      ),
                      Container(
                        // height: 200,
                        width: 300,
                        child: Column(
                          children: [
                            GameProfileLeftSection(cardLength: "short"),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [secondaryColor, bgPrimaryColor]),
                                ),
                                height: 100,
                                width: 300,
                              ),
                            )
                          ],
                        ), // Set the color for the green container
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: GameProfileScreen(),
        ),
      ],
    );
  }
}
