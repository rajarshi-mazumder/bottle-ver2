import 'package:flutter/material.dart';

import '../../../themes/themes.dart';

class PlayerStatItemCircular extends StatelessWidget {
  PlayerStatItemCircular({super.key});

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
