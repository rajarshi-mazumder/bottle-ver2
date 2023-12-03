import 'package:bottle_ver2/themes/customIconButtons.dart';
import 'package:bottle_ver2/themes/spacing.dart';
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
    CustomSpacing customSpacing = CustomSpacing(context: context);
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
          width: widget.isExpanded
              ? 300.0
              : customSpacing.leftSidebarCollapsedWidth,
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
              SidebarMenuItem(
                isExpanded: widget.isExpanded,
                label: "Game Profile",
                iconData: CupertinoIcons.game_controller_solid,
              ),
              SizedBox(height: 20),
              SidebarMenuItem(
                isExpanded: widget.isExpanded,
                label: "Stats",
                iconData: CupertinoIcons.graph_square_fill,
              ),

              // Add more items as needed
            ],
          ),
        ),
      ),
    );
  }
}

class SidebarMenuItem extends StatelessWidget {
  SidebarMenuItem(
      {super.key,
      required this.isExpanded,
      required this.iconData,
      required this.label});

  bool isExpanded;
  String label;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 18),
            CustomIcon(
              iconData: iconData,
              iconSize: 25,
            ),
            if (isExpanded) SizedBox(width: 20),
            if (isExpanded)
              Text(
                label,
                style: TextStyle(color: Colors.white),
              )
          ],
        ),
      ),
      onTap: () {
        // setState(() {
        //   isExpanded = !widget.isExpanded;
        // });
      },
    );
  }
}
