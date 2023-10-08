import 'package:flutter/material.dart';
import 'package:bottle_ver2/sharedWidgets/navbar.dart';
import 'package:bottle_ver2/sharedWidgets/searchBar.dart';
import 'package:bottle_ver2/themes/themes.dart';

import '../sharedWidgets/rightSidebar.dart';
import '../sharedWidgets/sidebar.dart';
import 'gameProfileWidgets/gameProfileLeftSection.dart';

class TournamentsScreen extends StatefulWidget {
  TournamentsScreen({super.key});

  double expandedHeight = 200;

  @override
  State<TournamentsScreen> createState() => _TournamentsScreenState();
}

class _TournamentsScreenState extends State<TournamentsScreen> {
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
                                            color: Colors.white, fontSize: 50)),
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

List<Map<String, dynamic>> tournaments = [
  {
    'date': "23'rd Oct, 2023 - 18:30 GMT + 9",
    "title": "VCT",
    "organizer": "Red Bull",
    "status": "Ongoing",
    "statusColor": Colors.green,
    "tournamentType": "VALORANT TOURNAMENT"
  },
  {
    'date': "3'rd Oct, 2023 - 21:30 GMT + 9",
    "title": "VCT Masters",
    "organizer": "Riot Games",
    "status": "Completed",
    "statusColor": Colors.orange,
    "tournamentType": "VALORANT TOURNAMENT"
  }
];

class TournamentsList extends StatefulWidget {
  TournamentsList({super.key, this.isSidebarExpanded = false});

  bool isSidebarExpanded;

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
      child: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * 0.17,
            top: 0,
            child: GameProfileLeftSection(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(top: 60, right: 200),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [secondaryColor, bgPrimaryColor])),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: ListView.builder(
                      itemCount: tournaments.length,
                      itemBuilder: (context, index) {
                        return TournamentTile(
                          date: tournaments[index]['date'],
                          title: tournaments[index]['title'],
                          organizer: tournaments[index]['organizer'],
                          tournamentType: tournaments[index]['tournamentType'],
                          status: tournaments[index]['status'],
                          statusColor: tournaments[index]['statusColor'],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            child: Sidebar(isExpanded: widget.isSidebarExpanded),
          ),
          Positioned(
            top: 50,
            right: 0,
            child: RightSidebar(isExpanded: widget.isSidebarExpanded),
          ),
        ],
      ),
    );
  }
}

class TournamentTile extends StatelessWidget {
  TournamentTile(
      {super.key,
      required this.date,
      required this.title,
      required this.organizer,
      required this.tournamentType,
      this.status = "Ongoing",
      this.statusColor = Colors.green});

  String date;
  String title;
  String organizer;
  String status;
  Color statusColor;
  String tournamentType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.only(bottom: 20),
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child:
                Text(date, style: TextStyle(fontSize: 12, color: Colors.grey)),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListTile(
                  title: Row(
                    children: [
                      Text(title),
                      RichText(
                        text: TextSpan(
                            text: "Status :   ",
                            style: TextStyle(color: Colors.white),
                            children: [
                              TextSpan(
                                  text: status,
                                  style: TextStyle(color: statusColor))
                            ]),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  subtitle: Text(organizer),
                ),
              ),
              Expanded(
                child: ListTile(
                  trailing: Text(tournamentType),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
