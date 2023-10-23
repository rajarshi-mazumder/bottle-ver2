import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';

BoxDecoration playerCardRowDecoration = BoxDecoration(
    color: bgSecondaryColor,
    borderRadius: BorderRadius.all(Radius.circular(10)));

class ValorantRole extends StatelessWidget {
  ValorantRole(
      {super.key,
      required this.iconUrl,
      required this.iconTitle,
      this.value = 0.5,
      this.radius = 50,
      this.showLabel = true,
      this.showProgressBar = true});

  String iconUrl;
  String iconTitle;
  double value;
  double radius;
  bool showLabel;
  bool showProgressBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              iconUrl,
              width: radius,
              height: radius,
            ),
            if (showProgressBar)
              Container(
                height: radius,
                width: radius,
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 10,
                  value: 100,
                ),
              ),
            if (showProgressBar)
              Container(
                height: radius,
                width: radius,
                child: CircularProgressIndicator(
                  backgroundColor: bgSecondaryColor,
                  color: primaryColor,
                  strokeWidth: 3,
                  value: value,
                ),
              ),
          ],
        ),
        SizedBox(height: 10),
        if (showLabel) Text(iconTitle),
      ],
    );
  }
}

class PlayerCardStatItem extends StatelessWidget {
  PlayerCardStatItem(
      {super.key, required this.cardWidth, required this.rowItems});

  double cardWidth;
  List<Widget> rowItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      constraints: BoxConstraints(minHeight: 80),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          decoration: playerCardRowDecoration,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rowItems,
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerCardProfilePic extends StatelessWidget {
  PlayerCardProfilePic({super.key, required this.profilePicUrl});

  String profilePicUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: bgSecondaryColor),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          child: Image.asset(
            profilePicUrl,
            fit: BoxFit.cover,
            height: 80,
            width: 80,
          ),
        ),
      ),
    );
  }
}

class ValorantAgents extends StatelessWidget {
  ValorantAgents(
      {super.key,
      required this.agentImgUrl,
      required this.iconTitle,
      this.value = 0.5,
      this.radius = 50,
      this.showLabel = true});

  String agentImgUrl;
  String iconTitle;
  double value;
  double radius;
  bool showLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                agentImgUrl,
                width: radius,
                height: radius,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        if (showLabel) Text(iconTitle),
      ],
    );
  }
}
