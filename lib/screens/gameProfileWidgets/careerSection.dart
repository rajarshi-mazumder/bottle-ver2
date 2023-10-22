import 'package:flutter/material.dart';

import '../../../themes/themes.dart';

class CareerSection extends StatelessWidget {
  CareerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        constraints: BoxConstraints(minHeight: 120),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: experienceList.length,
          itemBuilder: (context, index) {
            return experienceList[index];
          },
        ),
      ),
    );
  }
}

List<ExperienceTile> experienceList = [
  ExperienceTile(
      orgName: "Paper Rex",
      orgLogo: "orgPics/Paper_Rex_logo.png",
      timeSpent: "Jan 2023- present",
      expDescription:
          "I joined paper rex in the middle of the season, and transformed them. I was also the tournament MVP of the VCT Pacific League"),
  ExperienceTile(
      orgName: "Sengoku Gaming",
      orgLogo: "orgPics/Sengoku_Gaming.webp",
      timeSpent: "Dec 2020- Dec 2022",
      expDescription:
          "I played 2 years as a professional in Japan, as a part of Sengoku Gaming. I was the best duelist in the whole country, and won multiple tournaments with Sengoku Japan"),
  ExperienceTile(
      orgName: "Echo Fox",
      orgLogo: "orgPics/echo-fox.webp",
      timeSpent: "Aug 2020- Nov 2022",
      expDescription:
          "I won multiple tournaments with Echo Fox in Russia, and made a name for myself"),
];

class ExperienceTile extends StatelessWidget {
  ExperienceTile(
      {super.key,
      required this.orgName,
      required this.orgLogo,
      required this.timeSpent,
      required this.expDescription});

  String orgName;
  String orgLogo;
  String timeSpent;
  String expDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.work),
                  SizedBox(width: 10),
                  Text("${orgName} : "),
                  SizedBox(width: 10),
                  Container(
                    constraints: BoxConstraints(maxWidth: 25, maxHeight: 25),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(orgLogo),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Icon(Icons.calendar_month),
                  Text("   -"),
                  SizedBox(width: 10),
                  Text(timeSpent),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Text(expDescription),
          SectionDivider()
        ],
      ),
    );
  }
}

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Column(
        children: [
          SizedBox(height: 20),
          Divider(
            height: 1,
            color: bgTertiaryColor,
            indent: 10,
            endIndent: 10,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
