import 'package:bottle_ver2/themes/customIconButtons.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class Sidebar extends StatefulWidget {
  Sidebar({super.key, required this.isExpanded});

  bool isExpanded;

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isExpanded = !widget.isExpanded;
        });
      },
      child: MouseRegion(
        onEnter: (event) {
          if (!widget.isExpanded) {
            setState(() {
              widget.isExpanded = true;
            });
          }
        },
        onExit: (event) {
          if (widget.isExpanded) {
            setState(() {
              widget.isExpanded = false;
            });
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          // margin: EdgeInsets.only(top: 120),
          curve: Curves.easeInOut,
          width: widget.isExpanded ? 300.0 : 80.0,
          height: (MediaQuery.of(context).size.height) * 0.7,
          decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(sidebarBorderRadius),
                topRight: Radius.circular(sidebarBorderRadius),
              )),
          child: Column(
            children: [
              SizedBox(height: 40),
              ListTile(
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomIcon(
                          iconData: CupertinoIcons.game_controller_solid),
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
                      CustomIcon(iconData: CupertinoIcons.grid),
                      if (widget.isExpanded) SizedBox(width: 20),
                      if (widget.isExpanded)
                        Text(
                          "Stats",
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
        ),
      ),
    );
  }
}
