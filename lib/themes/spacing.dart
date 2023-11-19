import 'package:bottle_ver2/themes/platformSpecificOperations/platformCheck.dart';
import 'package:flutter/cupertino.dart';

class CustomSpacing {
  CustomSpacing({required BuildContext context}) {
    leftSidePosition = MediaQuery
        .of(context)
        .size
        .width * 0.09;
    rightSidePosition = MediaQuery
        .sizeOf(context)
        .width * 0.14;
    rightSideWidth = MediaQuery
        .of(context)
        .size
        .width * 0.56;
    leftSideWidth = 360;
    leftSidebarCollapsedWidth = 120;
    rightSidebarCollapsedWidth = 120;
  }

  double leftSidePosition = 0;
  double rightSidePosition = 0;
  double rightSideWidth = 0;
  double leftSideWidth = 0;
  double leftSidebarCollapsedWidth = 0;
  double rightSidebarCollapsedWidth = 0;

  double getLeftSectionWidth({required BuildContext context}) {
    return MediaQuery
        .of(context)
        .size
        .width > SCREEN_COLLAPSE_WIDTH
        ? leftSideWidth
        : MediaQuery
        .of(context)
        .size
        .width - 40;
  }

  double getRightSectionWidth({required BuildContext context}) {
    return MediaQuery
        .of(context)
        .size
        .width > SCREEN_COLLAPSE_WIDTH
        ? rightSideWidth
        : MediaQuery
        .of(context)
        .size
        .width - 40;
  }
}
