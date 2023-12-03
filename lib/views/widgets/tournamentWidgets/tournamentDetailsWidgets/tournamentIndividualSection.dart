import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

// import '../../../themes/themes.dart';

class TournamentIndividualSection extends StatelessWidget {
  TournamentIndividualSection(
      {super.key,
      required this.contentWidget,
      required this.label,
      required this.labelIcon});

  Widget contentWidget;
  Icon labelIcon;
  String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              labelIcon,
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: contentWidget,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: bgTertiaryColor, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ],
      ),
    );
  }
}
