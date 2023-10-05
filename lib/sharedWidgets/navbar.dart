import 'package:bottle_ver2/sharedWidgets/searchBar.dart';
import 'package:bottle_ver2/themes/customIconButtons.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double navbarTopMargin = 15;

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(100);

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
            margin: EdgeInsets.only(top: navbarTopMargin),
            child: CustomIconButton(
                icon: Icon(CupertinoIcons.bell), onPressed: () {})),
        SizedBox(width: 20),
        Container(
            margin: EdgeInsets.only(top: navbarTopMargin),
            child: CustomIconButton(
                icon: Icon(CupertinoIcons.person), onPressed: () {})),
        SizedBox(width: 20)
      ],
    );
  }
}
