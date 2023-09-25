import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';

class GameProfileLeftSection extends StatefulWidget {
  const GameProfileLeftSection({super.key});

  @override
  State<GameProfileLeftSection> createState() => _GameProfileLeftSectionState();
}

class _GameProfileLeftSectionState extends State<GameProfileLeftSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
            // color: Colors.blue,
            ),
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: 300,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 300, maxHeight: 600),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 400),
                          child: Image.asset('/Reyna-1.png')),
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
                          height: 400,
                          width: 300,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
