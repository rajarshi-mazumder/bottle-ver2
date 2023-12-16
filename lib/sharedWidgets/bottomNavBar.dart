import 'package:bottle_ver2/screens/gameProfileMobileScreenLayout.dart';
import 'package:flutter/material.dart';

import '../screens/gameProfileWebScreenLayout.dart';
import '../screens/tournamentsScreenLayout.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    decideNavigation({required int index}) {
      if (index == 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GameProfileMobileScreenLayout()));
      }
      if (index == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TournamentsScreenLayout()));
      }
    }

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_tree_sharp),
          label: "Watch",
        ),
      ],
      onTap: (int index) {
        decideNavigation(index: index);
      },
    );
  }
}
