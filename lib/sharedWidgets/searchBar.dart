import 'package:flutter/material.dart';

import '../themes/themes.dart';

class CustomSearchBar extends StatefulWidget {
  CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: bgSecondaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, bottom: 9),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',

              hintStyle: TextStyle(fontSize: 15, color: Colors.white),
              border: InputBorder.none, // Remove the underline
            ),
            // Implement search functionality here
            onChanged: (text) {
              // Handle search text changes
            },
            onSubmitted: (text) {
              // Handle search submission
            },
          ),
        ),
      ),
    );
  }
}
