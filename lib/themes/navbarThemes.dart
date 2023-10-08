import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle navbarTextStyle({double fontSize = 15}) {
  return TextStyle(fontSize: fontSize);
}

class NavbarMenuItem extends StatefulWidget {
  NavbarMenuItem(
      {super.key, required this.text, this.isActive = false, this.onPressed});

  String text;
  bool isActive;
  Function? onPressed;

  @override
  State<NavbarMenuItem> createState() => _NavbarMenuItemState();
}

class _NavbarMenuItemState extends State<NavbarMenuItem> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      widget.isActive = !widget.isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: navbarTextStyle(),
          ),
          SizedBox(height: 10),
          Container(
            height: 2,
            width: 40,
            color: (widget.isActive) ? primaryColor : Colors.transparent,
          )
        ],
      ),
    );
  }
}
