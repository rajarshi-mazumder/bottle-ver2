import 'package:bottle_ver2/screens/mainScreen.dart';
import 'package:bottle_ver2/sharedWidgets/navbar.dart';
import 'package:bottle_ver2/sharedWidgets/rightSidebar.dart';
import 'package:bottle_ver2/sharedWidgets/sidebar.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../sharedWidgets/searchBar.dart';
import '../themes/customIconButtons.dart';
import 'gameProfileWidgets/gameProfileLeftSection.dart';
import 'gamerProfileScreen.dart';

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
      appBar: NavBar(
        menuItemPlay: true,
      ),
      body: Stack(
        children: [
          Container(
            child: CustomScrollView(
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 50),
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
                                    CustomSearchBar(
                                        backgroundColor: bgTertiaryColor),
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
                                              colors: [
                                                secondaryColor,
                                                bgPrimaryColor
                                              ]),
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
                  child: MainScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
