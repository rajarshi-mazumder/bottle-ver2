import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color.fromRGBO(255, 70, 85, 1);
const secondaryColor = Color.fromARGB(255, 14, 14, 14);
const bgPrimaryColor = Color.fromARGB(255, 19, 19, 19);
const bgSecondaryColor = Color.fromARGB(255, 30, 30, 30);
const double sidebarBorderRadius = 30;
ThemeData customTheme = ThemeData(
    primaryColor: primaryColor,
    textTheme: GoogleFonts.nunitoTextTheme(),
    colorScheme: ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.transparent,
      // backgroundColor: secondaryColor,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
    ),
    tabBarTheme: TabBarTheme());
