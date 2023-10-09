import 'package:flutter/material.dart';

import '../../themes/themes.dart';

List<Map<String, dynamic>> tournaments = [
  {
    'date': "23rd Oct, 2023 - 18:30 GMT + 9",
    "title": "VCT",
    "organizer": "Red Bull",
    "status": "Ongoing",
    "statusColor": Colors.green,
    "tournamentType": "VALORANT TOURNAMENT"
  },
  {
    'date': "3rd Oct, 2023 - 21:30 GMT + 9",
    "title": "VCT Masters",
    "organizer": "Riot Games",
    "status": "Completed",
    "statusColor": Colors.orange,
    "tournamentType": "VALORANT TOURNAMENT"
  },
  {
    'date': "24th Dec, 2023 - 22:30 GMT + 9",
    "title": "Worlds 2023",
    "organizer": "Riot Games",
    "status": "Upcoming",
    "statusColor": Colors.blue,
    "tournamentType": "LOL TOURNAMENT"
  },
  {
    'date': "24th Dec, 2023 - 22:30 GMT + 9",
    "title": "Worlds 2023",
    "organizer": "Riot Games",
    "status": "Upcoming",
    "statusColor": Colors.blue,
    "tournamentType": "LOL TOURNAMENT"
  },
  {
    'date': "24th Dec, 2023 - 22:30 GMT + 9",
    "title": "Worlds 2023",
    "organizer": "Riot Games",
    "status": "Upcoming",
    "statusColor": Colors.blue,
    "tournamentType": "LOL TOURNAMENT"
  },
  {
    'date': "24th Dec, 2023 - 22:30 GMT + 9",
    "title": "Worlds 2023",
    "organizer": "Riot Games",
    "status": "Upcoming",
    "statusColor": Colors.blue,
    "tournamentType": "LOL TOURNAMENT"
  },
  {
    'date': "24th Dec, 2023 - 22:30 GMT + 9",
    "title": "Worlds 2023",
    "organizer": "Riot Games",
    "status": "Upcoming",
    "statusColor": Colors.blue,
    "tournamentType": "LOL TOURNAMENT"
  },
  {
    'date': "23rd Oct, 2023 - 18:30 GMT + 9",
    "title": "VCT",
    "organizer": "Red Bull",
    "status": "Ongoing",
    "statusColor": Colors.green,
    "tournamentType": "VALORANT TOURNAMENT"
  },
  {
    'date': "24th Dec, 2023 - 22:30 GMT + 9",
    "title": "Worlds 2023",
    "organizer": "Riot Games",
    "status": "Upcoming",
    "statusColor": Colors.blue,
    "tournamentType": "LOL TOURNAMENT"
  },
  {
    'date': "24th Dec, 2023 - 22:30 GMT + 9",
    "title": "Worlds 2023",
    "organizer": "Riot Games",
    "status": "Upcoming",
    "statusColor": Colors.blue,
    "tournamentType": "LOL TOURNAMENT"
  },
  {
    'date': "23rd Oct, 2023 - 18:30 GMT + 9",
    "title": "VCT",
    "organizer": "Red Bull",
    "status": "Ongoing",
    "statusColor": Colors.green,
    "tournamentType": "VALORANT TOURNAMENT"
  },
  {
    'date': "24th Dec, 2023 - 22:30 GMT + 9",
    "title": "Worlds 2023",
    "organizer": "Riot Games",
    "status": "Upcoming",
    "statusColor": Colors.blue,
    "tournamentType": "LOL TOURNAMENT"
  },
];

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
                      Expanded(child: Text(title)),
                      SizedBox(width: 100),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Status :   ",
                                  style: TextStyle(color: Colors.white),
                                  children: []),
                            ),
                            Text(status, style: TextStyle(color: statusColor)),
                          ],
                        ),
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
