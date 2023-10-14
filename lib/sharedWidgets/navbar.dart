import 'package:bottle_ver2/screens/gamerProfileScreen.dart';
import 'package:bottle_ver2/screens/gameProfileScreenLayout.dart';
import 'package:bottle_ver2/screens/tournamentsScreenLayout.dart';
import 'package:bottle_ver2/sharedWidgets/searchBar.dart';
import 'package:bottle_ver2/themes/customIconButtons.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/navbarThemes.dart';

const double navbarTopMargin = 10;

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  NavBar(
      {Key? key,
      this.menuItemPlay = true,
      this.menuItemWatch = false,
      this.menuItemShop = false})
      : super(key: key);
  bool menuItemPlay;

  bool menuItemWatch;

  bool menuItemShop;

  @override
  Size get preferredSize => Size.fromHeight(110);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgPrimaryColor,
      leading: Container(
        margin: EdgeInsets.only(top: navbarTopMargin),
        child: Row(
          children: [
            SizedBox(width: 20),
            Icon(
              Icons.headphones,
              size: 30,
            ),
          ],
        ),
      ),
      title: Container(
        margin: EdgeInsets.only(top: navbarTopMargin),
        child: Row(
          children: [
            SizedBox(width: 20),
            NavbarMenuItem(
              text: "Play",
              isActive: widget.menuItemPlay,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GameProfileScreenLayout()));
              },
            ),
            SizedBox(width: 20),
            NavbarMenuItem(
              text: "Watch",
              isActive: widget.menuItemWatch,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TournamentsScreenLayout()));
              },
            ),
            SizedBox(width: 30),
            NavbarMenuItem(text: "Shop", isActive: widget.menuItemShop),
            SizedBox(width: 30),
            Container(
              constraints: BoxConstraints(maxWidth: 500),
              // Limit search bar width
              child: CustomSearchBar(),
            ),
            SizedBox(
              width: 10,
            ),
            CustomIconButton(
                icon: Icon(CupertinoIcons.search), onPressed: () {}),
          ],
        ),
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            color: bgSecondaryColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
          ),
          width: 270,
          height: 200,
          child: Stack(children: [
            Positioned(
              top: 10,
              right: 20,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 17,
                    child: Icon(
                      Icons.notification_important_rounded,
                      size: 17,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 17,
                    child: Icon(
                      Icons.person,
                      size: 17,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                      width: 110,
                      height: 34,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          Text(
                            "Profile",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          SizedBox(width: 15),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                "https://www.dexerto.com/cdn-cgi/image/width=3840,quality=75,format=auto/https://editors.dexerto.com/wp-content/uploads/2022/09/03/optic-yay.jpg",
                                height: 28,
                                width: 28,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
