import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';

enum PlayerCardPosition { leftSide, topSide }

class GameProfileLeftSection extends StatefulWidget {
  GameProfileLeftSection(
      {super.key, this.playerCardPosition = PlayerCardPosition.leftSide});

  PlayerCardPosition playerCardPosition;

  @override
  State<GameProfileLeftSection> createState() => _GameProfileLeftSectionState();
}

class _GameProfileLeftSectionState extends State<GameProfileLeftSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
          // color: Colors.blue,
          ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300, maxHeight: 600),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Image.asset('/Reyna-1.png')),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: widget.playerCardPosition == PlayerCardPosition.leftSide
                    ? PlayerCardStatsType_1()
                    : PlayerCardStatsType_2(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerCardStatsType_1 extends StatelessWidget {
  const PlayerCardStatsType_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [secondaryColor, bgPrimaryColor]),
      ),
      height: 400,
      width: 300,
    );
  }
}

class PlayerCardStatsType_2 extends StatelessWidget {
  const PlayerCardStatsType_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [secondaryColor, bgPrimaryColor]),
      ),
      height: 200,
      width: 300,
    );
  }
}
