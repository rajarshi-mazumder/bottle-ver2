import 'dart:math';
// import 'package:bottle_ver2/screens/teamDetailsScreen.dart';
// import 'package:bottle_ver2/screens/tournamentDetailsScreen.dart';
// import 'package:bottle_ver2/screens/tournamentsScreen.dart';
import 'package:bottle_ver2/views/screens/teamDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:bottle_ver2/sharedWidgets/navbar.dart';
// import 'package:bottle_ver2/sharedWidgets/searchBar.dart';
import 'package:bottle_ver2/themes/themes.dart';

import '../widgets/sharedWidgets/navbar.dart';

class TeamDetailLayoutScreenLayout extends StatefulWidget {
  TeamDetailLayoutScreenLayout({super.key});

  double expandedHeight = 200;

  @override
  State<TeamDetailLayoutScreenLayout> createState() =>
      _TeamDetailLayoutScreenLayoutState();
}

class _TeamDetailLayoutScreenLayoutState
    extends State<TeamDetailLayoutScreenLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      appBar: NavBarWeb(
        menuItemWatch: true,
        menuItemPlay: false,
        menuItemShop: false,
      ),
      body: Stack(
        children: [
          Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  expandedHeight: widget.expandedHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Image.asset(
                          "/orgWallpapers/optic.webp",
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                constraints: BoxConstraints(minWidth: 400),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Optic Gaming",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 50)),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          child: Image.asset(
                                            "orgWallpapers/x.webp",
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                        ),
                                        ClipRRect(
                                          child: Image.asset(
                                            "orgWallpapers/meta.webp",
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                // Set the color for the blue container
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: TeamDetailsScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
