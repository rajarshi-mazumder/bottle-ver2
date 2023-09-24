import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color.fromRGBO(255, 70, 85, 1);
const secondaryColor = Color.fromARGB(255, 17, 0, 0);
const bgPrimaryColor = Color.fromARGB(255, 19, 19, 19);
const bgSecondaryColor = Color.fromARGB(255, 30, 30, 30);
ThemeData customTheme = ThemeData(
  primaryColor: primaryColor,
  textTheme: GoogleFonts.nunitoTextTheme(),
  colorScheme: ColorScheme.dark(),
  appBarTheme: const AppBarTheme(
    shadowColor: Colors.black,
    backgroundColor: secondaryColor,
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
  ),
);
