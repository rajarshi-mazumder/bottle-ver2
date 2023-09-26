import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';

class GameProfileTopSection extends StatelessWidget
    implements PreferredSizeWidget {
  GameProfileTopSection({Key? key, required this.tabBar}) : super(key: key);
  TabBar tabBar;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        alignment: Alignment.center,
        color: bgPrimaryColor,
        margin: EdgeInsets.only(left: 300, top: 30),
        width: 1200,
        child: Column(
          children: [
            SizedBox(height: 40),
            Expanded(child: tabBar),
          ],
        ),
      ),
    );
  }

  ///width doesnt matter
  @override
  Size get preferredSize => Size(200, 150);
}
