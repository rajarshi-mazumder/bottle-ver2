import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize = 20,
  });

  Icon icon;
  Function onPressed;
  double iconSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      color: primaryColor,
      child: IconButton(
        icon: icon,
        iconSize: iconSize,
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  CustomIcon({
    super.key,
    required this.iconData,
    this.iconSize = 18,
  });

  IconData iconData;
  double iconSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(
          iconData,
          size: iconSize,
        ),
      ),
    );
  }
}
