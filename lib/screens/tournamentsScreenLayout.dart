import 'dart:math';

import 'package:bottle_ver2/screens/tournamentsScreen.dart';
import 'package:flutter/material.dart';
import 'package:bottle_ver2/sharedWidgets/navbar.dart';
import 'package:bottle_ver2/sharedWidgets/searchBar.dart';
import 'package:bottle_ver2/themes/themes.dart';

import '../sharedWidgets/rightSidebar.dart';
import '../sharedWidgets/sidebar.dart';
import 'gameProfileWidgets/gameProfileLeftSection.dart';

class TournamentsScreenLayout extends StatefulWidget {
  TournamentsScreenLayout({super.key});

  double expandedHeight = 200;

  @override
  State<TournamentsScreenLayout> createState() =>
      _TournamentsScreenLayoutState();
}

class _TournamentsScreenLayoutState extends State<TournamentsScreenLayout> {
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
                          "/omen3.png",
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
                                width: 400,

                                child: Column(
                                  children: [
                                    Text("TOURNAMENTS",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 50)),
                                    CustomSearchBar(
                                      backgroundColor: bgTertiaryColor,
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
                  child: TournamentsScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
