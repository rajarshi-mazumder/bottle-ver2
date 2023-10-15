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

class TournamentDetailItemLong extends StatelessWidget {
  TournamentDetailItemLong(
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
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          labelWidget,
          Expanded(
            flex: 3,
            child: Row(
              children: [
                SizedBox(width: 20),
                Text(
                  labelText,
                  style: TextStyle(color: Colors.grey, fontSize: textFontSize),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              descriptionText,
              style: TextStyle(fontSize: textFontSize),
            ),
          ),
        ],
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
            alignment: Alignment.centerLeft,
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
