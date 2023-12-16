import 'package:flutter/material.dart';

import '../../../themes/themes.dart';

class TournamentDetailItemShort extends StatelessWidget {
  TournamentDetailItemShort(
      {super.key,
      this.textFontSize = 12,
      required this.labelText,
      required this.descriptionText,
      required this.labelWidget});

  double textFontSize;
  String labelText;
  String descriptionText;
  Widget labelWidget;

  @override
  Widget build(BuildContext context) {
    double sizedBoxWidth = textFontSize <= 12 ? 10 : 15;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        labelWidget,
        SizedBox(width: sizedBoxWidth),
        Container(
          constraints: BoxConstraints(minHeight: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelText,
                style: TextStyle(color: Colors.grey, fontSize: textFontSize),
              ),
              SizedBox(width: sizedBoxWidth),
              Text(
                descriptionText,
                style: TextStyle(fontSize: textFontSize),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TournamentDetailItemShort_Type2 extends StatelessWidget {
  TournamentDetailItemShort_Type2(
      {super.key,
      this.textFontSize = 12,
      required this.labelText,
      required this.descriptionText,
      required this.labelWidget});

  double textFontSize;
  String labelText;
  String descriptionText;
  Widget labelWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        labelWidget,
        Container(
          width: 60,
          child: Row(
            children: [
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  labelText,
                  style: TextStyle(color: Colors.grey, fontSize: textFontSize),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 5),
        Text(
          descriptionText,
          style: TextStyle(fontSize: textFontSize),
        ),
      ],
    );
  }
}

class TournamentDetailEllipticalItem extends StatelessWidget {
  TournamentDetailEllipticalItem(
      {super.key,
      this.textFontSize = 12,
      required this.labelText,
      required this.descriptionText,
      required this.labelWidget});

  double textFontSize;
  String labelText;
  String descriptionText;
  Widget labelWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(200))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                labelWidget,
                SizedBox(width: 10),
                Text(
                  labelText,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(descriptionText,
                style: customTheme.textTheme.labelMedium?.copyWith(
                  fontSize: 15,
                )),
          ],
        ),
      ),
    );
  }
}

class SectionButton extends StatelessWidget {
  const SectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
            indent: 5,
            endIndent: 5,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class TournamentSectionButton extends StatelessWidget {
  TournamentSectionButton(
      {super.key, this.onPressed, required this.buttonText});

  String buttonText;
  Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed!();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      child: Container(
        height: 50,
        child: Align(
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}

class TournamentSponsor extends StatelessWidget {
  TournamentSponsor(
      {super.key,
      this.textFontSize = 12,
      required this.descriptionText,
      required this.labelWidget});

  double textFontSize;
  String descriptionText;
  Widget labelWidget;

  @override
  Widget build(BuildContext context) {
    double sizedBoxWidth = textFontSize <= 12 ? 10 : 15;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        labelWidget,
        SizedBox(width: sizedBoxWidth),
        Text(
          descriptionText,
          style: TextStyle(fontSize: textFontSize),
        )
      ],
    );
  }
}
