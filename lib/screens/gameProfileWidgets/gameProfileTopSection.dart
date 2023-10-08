import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';

class GameProfileTopSection
    extends StatelessWidget // implements PreferredSizeWidget
{
  GameProfileTopSection({Key? key, required this.tabBar}) : super(key: key);
  final TabBar tabBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 400,
          color: Colors.black,
          child: Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              '/fade5_1.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.center,
        //   child: Container(
        //     width: 1060,
        //     height: 60,
        //     // Set the fixed width of the Container
        //     decoration: BoxDecoration(
        //         color: Color.fromARGB(230, 0, 0, 0),
        //         borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(
        //               10,
        //             ),
        //             topRight: Radius.circular(10))),
        //     child: tabBar,
        //   ),
        // ),
      ],
    );
  }

// @override
// Size get preferredSize => Size(200, 800);
}
