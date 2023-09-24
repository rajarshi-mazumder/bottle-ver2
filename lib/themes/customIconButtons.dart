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
