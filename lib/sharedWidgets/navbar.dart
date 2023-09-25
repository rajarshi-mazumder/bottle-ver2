import 'package:bottle_ver2/themes/customIconButtons.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Row(
            children: [
              SizedBox(width: 20),
              Icon(
                Icons.headphones,
                size: 30,
              ),
            ],
          ); // Hamburger menu icon
        },
      ),
      title: Row(
        children: [
          SizedBox(width: 20),
          Container(
            constraints: BoxConstraints(maxWidth: 500),
            // Limit search bar width
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: bgSecondaryColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(fontSize: 15),
                      border: InputBorder.none, // Remove the underline
                    ),
                    // Implement search functionality here
                    onChanged: (text) {
                      // Handle search text changes
                    },
                    onSubmitted: (text) {
                      // Handle search submission
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CustomIconButton(icon: Icon(CupertinoIcons.search), onPressed: () {}),
        ],
      ),
      actions: [
        CustomIconButton(icon: Icon(CupertinoIcons.bell), onPressed: () {}),
        SizedBox(width: 20),
        CustomIconButton(icon: Icon(CupertinoIcons.person), onPressed: () {}),
        SizedBox(width: 20)
      ],
    );
  }
}
