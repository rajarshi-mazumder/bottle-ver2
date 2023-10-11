import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';

class GameProfileLeftSection extends StatefulWidget {
  GameProfileLeftSection(
      {super.key, this.cardLengthType = "long", this.cardWidth = 300});

  double cardWidth = 300;
  String cardLengthType;

  @override
  State<GameProfileLeftSection> createState() => _GameProfileLeftSectionState();
}

class _GameProfileLeftSectionState extends State<GameProfileLeftSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
          // color: Colors.blue,
          ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300, maxHeight: 600),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Image.asset(
                      '/Reyna-1.png',
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [secondaryColor, bgPrimaryColor]),
                      ),
                      height: widget.cardLengthType == "long" ? 400 : 70,
                      width: 300,
                    ),
                  )
                ],
              ),
              Positioned(
                  top: 160,
                  child: Container(
                      width: widget.cardWidth,
                      child: Center(
                          child: Text(
                        "TenZ",
                        style: TextStyle(fontSize: 25),
                      ))))
            ],
          ),
        ),
      ),
    );
  }
}
