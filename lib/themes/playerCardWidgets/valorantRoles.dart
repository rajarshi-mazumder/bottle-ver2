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
      this.value = 0.5});

  String iconUrl;
  String iconTitle;
  double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              iconUrl,
              width: 50,
              height: 50,
            ),
            Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 10,
                value: 100,
              ),
            ),
            Container(
              height: 50,
              width: 50,
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
        Text(iconTitle),
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
