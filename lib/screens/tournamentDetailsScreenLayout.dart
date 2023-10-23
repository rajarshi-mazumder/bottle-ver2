import 'dart:math';

import 'package:bottle_ver2/screens/tournamentDetailsScreen.dart';
import 'package:bottle_ver2/screens/tournamentsScreen.dart';
import 'package:flutter/material.dart';
import 'package:bottle_ver2/sharedWidgets/navbar.dart';
import 'package:bottle_ver2/sharedWidgets/searchBar.dart';
import 'package:bottle_ver2/themes/themes.dart';

import '../sharedWidgets/rightSidebar.dart';
import '../sharedWidgets/sidebar.dart';
import 'gameProfileWidgets/gameProfileLeftSection.dart';

class TournamentDetailScreenLayout extends StatefulWidget {
  TournamentDetailScreenLayout({super.key});

  double expandedHeight = 200;

  @override
  State<TournamentDetailScreenLayout> createState() =>
      _TournamentDetailScreenLayoutState();
}

class _TournamentDetailScreenLayoutState
    extends State<TournamentDetailScreenLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      appBar: NavBar(
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
                          "/valoImages/yoru-valorant.jpg",
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
                                    Text(
                                      "23rd Oct - 3rd Nov, 2023",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20),
                                    ),
                                    Text("VCT Masters Tokyo",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 50)),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "Organized by  ",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15)),
                                      TextSpan(
                                          text: "Riot Games",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))
                                    ]))
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
                  child: TournamentDetailsScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
