import 'package:bottle_ver2/sharedWidgets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../sharedWidgets/bottomNavBar.dart';

enum ScreenLayouts { WebDesktop, WebMobile, Mobile }

double SCREEN_COLLAPSE_WIDTH = 800;

class PlatformCheck {
  static bool isInstantiateSidebar({required BuildContext context}) {
    if (kIsWeb && MediaQuery.of(context).size.width > SCREEN_COLLAPSE_WIDTH) {
      return false;
    } else {
      return true;
    }
  }

  static PreferredSizeWidget instatntiateNavBar(
      {required BuildContext context,
      bool menuItemPlay = false,
      bool menuItemWatch = false,
      bool menuItemShop = false}) {
    if (kIsWeb && MediaQuery.of(context).size.width > SCREEN_COLLAPSE_WIDTH) {
      return NavBarWeb(
          menuItemWatch: menuItemWatch,
          menuItemPlay: menuItemPlay,
          menuItemShop: menuItemShop);
    } else if (kIsWeb &&
        MediaQuery.of(context).size.width <= SCREEN_COLLAPSE_WIDTH) {
      return NavBarMobile(
          menuItemWatch: menuItemWatch,
          menuItemPlay: menuItemPlay,
          menuItemShop: menuItemShop);
    } else if (!kIsWeb) {
      return NavBarMobile(
          menuItemWatch: menuItemWatch,
          menuItemPlay: menuItemPlay,
          menuItemShop: menuItemShop);
    } else
      return NavBarMobile(
          menuItemWatch: menuItemWatch,
          menuItemPlay: menuItemPlay,
          menuItemShop: menuItemShop);
  }

  static instantiateBottomNavBar({required BuildContext context}) {
    if (kIsWeb && MediaQuery.of(context).size.width > SCREEN_COLLAPSE_WIDTH) {
      return Container(height: 1);
    } else if (kIsWeb &&
        MediaQuery.of(context).size.width <= SCREEN_COLLAPSE_WIDTH) {
      return BottomNavBar();
    } else
      return BottomNavBar();
  }
}
