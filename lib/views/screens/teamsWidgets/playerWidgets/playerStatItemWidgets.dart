import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

// import '../../../themes/themes.dart';

class PlayerStatTextItemCircular extends StatelessWidget {
  PlayerStatTextItemCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(100))),
      height: 64,
      width: 64,
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: Column(
          children: [
            SizedBox(height: 12),
            Text("KDA",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: primaryColor, fontSize: 15)),
            Text(
              "19/5",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerStatImageItemCircular extends StatelessWidget {
  PlayerStatImageItemCircular({super.key, required this.imageUrl});

  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(100))),
      height: 64,
      width: 64,
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: Image.asset(imageUrl),
      ),
    );
  }
}
