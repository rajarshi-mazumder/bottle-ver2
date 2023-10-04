import 'package:bottle_ver2/sharedWidgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: StickyHeader(
        header: Container(
          height: (MediaQuery.of(context).size.height) * 0.7,
          child: Sidebar(
            isExpanded: false,
          ),
        ),
        content: Container(
          child: Image.network(
            'https://cdn.arstechnica.net/wp-content/uploads/2020/04/valorant-listing-800x450.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),
        ),
      ),
    );
  }
}
