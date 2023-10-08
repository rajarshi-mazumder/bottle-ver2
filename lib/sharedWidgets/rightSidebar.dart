import 'package:bottle_ver2/themes/profileIcons.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class RightSidebar extends StatefulWidget {
  RightSidebar({super.key, required this.isExpanded});

  bool isExpanded;

  @override
  _RightSidebarState createState() => _RightSidebarState();
}

class _RightSidebarState extends State<RightSidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isExpanded ? 300.0 : 80.0,
      height: (MediaQuery.of(context).size.height) * 0.7,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(sidebarBorderRadius),
            topLeft: Radius.circular(sidebarBorderRadius),
          )),
      child: Column(
        children: [
          SizedBox(height: 40),
          ListTile(
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProfileIconButton(
                    imgUrl: "/profilePics/yay.webp",
                    onPressed: () {},
                    isOnline: true,
                  ),
                  if (widget.isExpanded) SizedBox(width: 20),
                  if (widget.isExpanded)
                    Text(
                      "Game Profile",
                      style: TextStyle(color: Colors.white),
                    )
                ],
              ),
            ),
            onTap: () {
              setState(() {
                widget.isExpanded = !widget.isExpanded;
              });
            },
          ),
          SizedBox(height: 20),
          ListTile(
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProfileIconButton(
                    imgUrl: "/profilePics/fns.webp",
                    onPressed: () {},
                  ),
                  if (widget.isExpanded) SizedBox(width: 20),
                  if (widget.isExpanded)
                    Text(
                      "Game Profile",
                      style: TextStyle(color: Colors.white),
                    )
                ],
              ),
            ),
            onTap: () {
              setState(() {
                widget.isExpanded = !widget.isExpanded;
              });
            },
          ),
          SizedBox(height: 20),
          ListTile(
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProfileIconButton(
                    imgUrl: "/profilePics/boaster.jpg",
                    onPressed: () {},
                    isOnline: true,
                  ),
                  if (widget.isExpanded) SizedBox(width: 20),
                  if (widget.isExpanded)
                    Text(
                      "Game Profile",
                      style: TextStyle(color: Colors.white),
                    )
                ],
              ),
            ),
            onTap: () {
              setState(() {
                widget.isExpanded = !widget.isExpanded;
              });
            },
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}
