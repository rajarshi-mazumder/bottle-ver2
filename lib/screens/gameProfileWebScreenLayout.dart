import 'package:bottle_ver2/screens/temp.dart';
import 'package:bottle_ver2/sharedWidgets/navbar.dart';
import 'package:bottle_ver2/sharedWidgets/rightSidebar.dart';
import 'package:bottle_ver2/sharedWidgets/sidebar.dart';
import 'package:bottle_ver2/themes/platformSpecificOperations/platformCheck.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../sharedWidgets/searchBar.dart';
import '../themes/customIconButtons.dart';
import 'gameProfileMobileScreen.dart';
import 'gameProfileWidgets/gameProfileLeftSection.dart';
import 'gamerProfileWebScreen.dart';

class GameProfileWebScreenLayout extends StatefulWidget {
  GameProfileWebScreenLayout({super.key});

  @override
  State<GameProfileWebScreenLayout> createState() =>
      _GameProfileWebScreenLayoutState();
}

class _GameProfileWebScreenLayoutState
    extends State<GameProfileWebScreenLayout> {
  bool isSidebarExpanded = false;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      appBar: PlatformCheck.instatntiateNavBar(
          context: context, menuItemPlay: true),
      body: Stack(
        children: [
          Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: bgPrimaryColor,
                  pinned: false,
                  expandedHeight: 400,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Image.asset(
                          "/omen3.png",
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 100, right: 100),
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
                                    GameProfileLeftSection(
                                        cardLengthType: "short"),
                                    SizedBox(height: 20),
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
                                        height: 80,
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
                SliverToBoxAdapter(child: GameProfileWebScreen()),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          PlatformCheck.instantiateBottomNavBar(context: context),
      // drawer: PlatformCheck.isInstantiateSidebar(context: context)
      //     ? Sidebar(isExpanded: true)
      //     : null,
      drawer: Sidebar(isExpanded: true),
    );
  }
}
