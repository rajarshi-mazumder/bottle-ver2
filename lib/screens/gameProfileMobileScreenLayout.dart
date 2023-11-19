import 'package:bottle_ver2/screens/temp.dart';
import 'package:bottle_ver2/screens/tournamentWidgets/tournamentRightSection.dart';
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
import '../themes/customTabBarThemes.dart';
import 'gameProfileMobileScreen.dart';
import 'gameProfileWidgets/gameProfileLeftSection.dart';
import 'gameProfileWidgets/gameProfileRightSection.dart';
import 'gamerProfileWebScreen.dart';

class GameProfileMobileScreenLayout extends StatefulWidget {
  GameProfileMobileScreenLayout({super.key});

  @override
  State<GameProfileMobileScreenLayout> createState() =>
      _GameProfileMobileScreenLayoutState();
}

class _GameProfileMobileScreenLayoutState
    extends State<GameProfileMobileScreenLayout> with TickerProviderStateMixin {
  bool isSidebarExpanded = false;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      appBar: PlatformCheck.instatntiateNavBar(
          context: context, menuItemPlay: true),
      backgroundColor: bgPrimaryColor,
      body: CustomScrollView(
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
                    child: Container(
                      height: 200,
                      width: 300,

                      child: Column(
                        children: [
                          Text("VALORANT",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 50)),
                          CustomSearchBar(backgroundColor: bgTertiaryColor),
                        ],
                      ),
                      // Set the color for the blue container
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Center(child: GameProfileLeftSection()),
              // GameProfileMobileScreen(),
              Container(
                  height: 60,
                  decoration: BoxDecoration(color: secondaryColor),
                  child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      indicator: CustomTabIndicator(),
                      controller: tabController,
                      // indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Text("Game Profile"),
                        Text("Tournaments"),
                        Text("Posts")
                      ])),
              GameProfileMobileScreen(tabController: tabController),
            ]),
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
