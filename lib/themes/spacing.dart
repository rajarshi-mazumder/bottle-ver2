import 'package:flutter/cupertino.dart';

class CustomSpacing {
  CustomSpacing({required BuildContext context}) {
    leftSidePosition = MediaQuery.of(context).size.width * 0.07;
    rightSidePosition = MediaQuery.sizeOf(context).width * 0.1;
    rightSideWidth = MediaQuery.of(context).size.width * 0.65;
  }

  double leftSidePosition = 0;
  double rightSidePosition = 0;
  double rightSideWidth = 0;
}
