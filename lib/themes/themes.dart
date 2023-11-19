import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color.fromRGBO(255, 70, 85, 1);
const secondaryColor = Color.fromARGB(255, 14, 14, 14);
const bgPrimaryColor = Color.fromARGB(255, 19, 19, 19);

const bgSecondaryColor = Color.fromARGB(255, 30, 30, 30);
const bgTertiaryColor = Color.fromARGB(255, 100, 100, 100);
const double sidebarBorderRadius = 30;
ThemeData customTheme = ThemeData(
  primaryColor: primaryColor,
  // textTheme: GoogleFonts.robotoCondensedTextTheme(
  //     TextTheme(bodyLarge: TextStyle(color: Colors.white))),
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontFamily: "MonumentExtended"),
    labelMedium: TextStyle(fontFamily: "MonumentExtended"),
    displayLarge: TextStyle(fontFamily: "MonumentExtended"),
    displayMedium: TextStyle(fontFamily: "MonumentExtended"),
  ),
  colorScheme: ColorScheme.dark(),
  appBarTheme: const AppBarTheme(
    shadowColor: Colors.transparent,
    // backgroundColor: secondaryColor,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: bgSecondaryColor,
        textStyle: TextStyle(color: Colors.white)),
  ),
  tabBarTheme: TabBarTheme(),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      selectedLabelStyle: TextStyle(fontFamily: "MonumentExtended"),
      unselectedLabelStyle: TextStyle(fontFamily: "MonumentExtended"),
      backgroundColor: secondaryColor),
);
