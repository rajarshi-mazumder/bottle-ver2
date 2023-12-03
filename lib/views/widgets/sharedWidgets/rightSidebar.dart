import 'package:bottle_ver2/themes/profileIcons.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../../themes/spacing.dart';
import '../themes/spacing.dart';

class RightSidebar extends StatefulWidget {
  RightSidebar({super.key, required this.isExpanded});

  bool isExpanded;

  @override
  _RightSidebarState createState() => _RightSidebarState();
}

class _RightSidebarState extends State<RightSidebar> {
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
              : customSpacing.rightSidebarCollapsedWidth,
          height: (MediaQuery.of(context).size.height) * 0.7,
          decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(sidebarBorderRadius),
                topLeft: Radius.circular(sidebarBorderRadius),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Online", style: customTheme.textTheme.labelMedium),
                  SizedBox(width: 30),
                ],
              ),
              SizedBox(height: 50),
              RightSidebarPlayerIcon(
                isExpanded: widget.isExpanded,
                profilePic: "/profilePics/yay.webp",
                name: "Yay",
              ),
              SizedBox(height: 20),
              RightSidebarPlayerIcon(
                isExpanded: widget.isExpanded,
                profilePic: "/profilePics/boaster.jpg",
                name: "Boaster",
              ),
              SizedBox(height: 20),
              RightSidebarPlayerIcon(
                isExpanded: widget.isExpanded,
                profilePic: "/profilePics/fns.webp",
                name: "FNS",
              ),
              // Add more items as needed
            ],
          ),
        ),
      ),
    );
  }
}

class RightSidebarPlayerIcon extends StatelessWidget {
  RightSidebarPlayerIcon({
    super.key,
    required this.isExpanded,
    required this.name,
    required this.profilePic,
  });

  bool isExpanded;

  String profilePic;

  String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          children: [
            if (isExpanded)
              SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    name,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            SizedBox(width: 18),
            ProfileIconButton(
              imgUrl: profilePic,
              onPressed: () {},
              isOnline: true,
            ),
            SizedBox(width: 20),
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
