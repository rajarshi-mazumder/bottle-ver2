import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';

class ProfileIconButton extends StatelessWidget {
  ProfileIconButton(
      {super.key,
      required this.onPressed,
      this.iconSize = 20,
      required this.imgUrl,
      this.isOnline = false});

  Function onPressed;
  double iconSize;
  String imgUrl;
  bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.black,
          backgroundImage: AssetImage(imgUrl),
        ),
      ),
      if (isOnline)
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            height: 10,
            width: 10,
          ),
        )
    ]);
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
