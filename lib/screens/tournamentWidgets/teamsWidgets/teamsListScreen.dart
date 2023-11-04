import 'package:bottle_ver2/screens/teamDetailsScreenLayout.dart';
import 'package:flutter/material.dart';

import '../../../models/tournamentModels/team.dart';
import '../../../models/tournamentModels/tournamentModels.dart';
import '../../../themes/themes.dart';
import '../../tournamentDetailsScreen.dart';

class TeamsListScreen extends StatelessWidget {
  TeamsListScreen({super.key, this.allBordersRounded = true});

  bool allBordersRounded;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ClipRRect(
        borderRadius: allBordersRounded
            ? BorderRadius.all(Radius.circular(20))
            : BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [secondaryColor, bgPrimaryColor])),
          // width: MediaQuery.of(context).size.width * 0.6,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView.builder(
              itemCount: teams.length,
              itemBuilder: (context, index) {
                return TeamTile(
                  name: teams[index].name!,
                  regionFlag: teams[index].regionFlag!,
                  teamLogo: teams[index].teamLogo!,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TeamTile extends StatelessWidget {
  TeamTile({
    super.key,
    required this.name,
    required this.regionFlag,
    required this.teamLogo,
  });

  String name;
  String regionFlag;
  String teamLogo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TeamDetailLayoutScreenLayout()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgSecondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: EdgeInsets.only(bottom: 20),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        teamLogo,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(name),
                        SizedBox(width: 20),
                        Image.asset(
                          regionFlag,
                          width: 20,
                          height: 20,
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      "6 members",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Row(
              children: [
                Image.asset("gameLogos/valorant-logo.webp",
                    height: 40, width: 40, fit: BoxFit.cover),
                SizedBox(width: 20)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
