import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';

class GameProfileLeftSection extends StatefulWidget {
  GameProfileLeftSection({super.key, this.cardLength = "long"});

  String cardLength;

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
          child: Column(
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
                  height: widget.cardLength == "long" ? 400 : 70,
                  width: 300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
