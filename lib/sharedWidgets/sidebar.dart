import 'package:bottle_ver2/themes/customIconButtons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  Sidebar({super.key, required this.isExpanded});

  bool isExpanded;

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: Alignment.centerLeft,
      // key: this,
      child: Container(
        width: widget.isExpanded ? 300.0 : 80.0,
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  CustomIcon(iconData: CupertinoIcons.game_controller_solid),
                  if (widget.isExpanded) SizedBox(width: 20),
                  if (widget.isExpanded)
                    Text("Game Profile", style: TextStyle(color: Colors.white))
                ],
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
    );
  }
}
