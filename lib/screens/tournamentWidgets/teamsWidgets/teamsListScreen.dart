import 'package:flutter/material.dart';

import '../../../models/tournamentModels/tournamentModels.dart';
import '../../../themes/themes.dart';

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
          width: MediaQuery.of(context).size.width * 0.5,
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

List<Team> teams = [
  Team(
      name: "Optic",
      regionFlag: "flags/us.png",
      membersCount: 6,
      teamLogo: "orgPics/optic.jpeg"),
  Team(
      name: "NAVI",
      regionFlag: "flags/ukraine.webp",
      membersCount: 6,
      teamLogo: "orgPics/navi.png"),
  Team(
      name: "Fnatic",
      regionFlag: "flags/uk.png",
      membersCount: 5,
      teamLogo: "orgPics/fnatic.png"),
  Team(
      name: "PRX",
      regionFlag: "flags/singapore.png",
      membersCount: 6,
      teamLogo: "orgPics/Paper_Rex_logo.png"),
  Team(
      name: "Sentinels",
      regionFlag: "flags/us.png",
      membersCount: 6,
      teamLogo: "orgPics/sentinels.png"),
  Team(
      name: "Cloud 9",
      regionFlag: "flags/us.png",
      membersCount: 6,
      teamLogo: "orgPics/Cloud9.png"),
  Team(
      name: "DRX",
      regionFlag: "flags/sk.png",
      membersCount: 6,
      teamLogo: "orgPics/drx.png"),
  Team(
      name: "Zeta",
      regionFlag: "flags/jp.png",
      membersCount: 6,
      teamLogo: "orgPics/zeta.png"),
];

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
      onTap: () {},
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
