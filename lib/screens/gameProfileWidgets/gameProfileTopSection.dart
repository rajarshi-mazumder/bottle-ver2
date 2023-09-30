import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';

class GameProfileTopSection extends StatelessWidget
    implements PreferredSizeWidget {
  GameProfileTopSection({Key? key, required this.tabBar}) : super(key: key);
  final TabBar tabBar;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        alignment: Alignment.centerLeft,
        // Align the Container to the left
        color: bgPrimaryColor,
        margin: EdgeInsets.only(top: 0),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 180,
              color: Colors.green,
              child: Image.asset(
                '/fade1.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 1200,
                  // Set the fixed width of the Container
                  decoration: BoxDecoration(
                      color: Color.fromARGB(180, 0, 0, 0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            20,
                          ),
                          topRight: Radius.circular(20))),
                  child: tabBar,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(200, 180);
}
