import 'package:flutter/material.dart';
import 'package:bottle_ver2/sharedWidgets/navbar.dart';
import 'package:bottle_ver2/sharedWidgets/searchBar.dart';
import 'package:bottle_ver2/themes/themes.dart';

import 'gameProfileWidgets/gameProfileLeftSection.dart';

class TournamentsScreen extends StatefulWidget {
  TournamentsScreen({super.key});

  double expandedHeight = 550;

  @override
  State<TournamentsScreen> createState() => _TournamentsScreenState();
}

class _TournamentsScreenState extends State<TournamentsScreen> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        widget.expandedHeight = 200;
      });
    }
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
                AnimatedContainer(
                  duration: Duration(milliseconds: 100000),
                  child: SliverAppBar(
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
                                horizontal: 100, vertical: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 200,
                                  width: 500,
                                  child: Column(
                                    children: [
                                      Text("TOURNAMENTS",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 50)),
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
                ),
                SliverToBoxAdapter(
                  child: TournamentsList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TournamentsList extends StatefulWidget {
  TournamentsList({super.key});

  @override
  State<TournamentsList> createState() => _TournamentsListState();
}

class _TournamentsListState extends State<TournamentsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [bgPrimaryColor, bgSecondaryColor],
        ),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("VCT"),
            trailing: Text("VALORANT TOURNAMENT"),
          )
        ],
      ),
    );
  }
}
