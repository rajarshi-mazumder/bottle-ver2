import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> items = [
  'Valorant',
  'CS 2',
  'Apex Legends',
  'Overwatch',
  'League of Legends',
];

class CustomDropdown extends StatefulWidget {
  String? value;

  CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.green, width: 4),

          borderRadius: BorderRadius.circular(10),
          color: bgSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            value: widget.value,
            isExpanded: true,
            style: TextStyle(color: primaryColor),
            selectedItemBuilder: (BuildContext context) => items
                .map<Widget>((item) => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Icon(Icons.palette, color: primaryColor)),
                        Text(item),
                      ],
                    ))
                .toList(),
            iconSize: 20,
            icon: Icon(CupertinoIcons.arrowtriangle_down),
            items: items.map(buildMenuItem).toList(),
            onChanged: (onChanged) {
              setState(() {
                widget.value = onChanged;
              });
            }),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontSize: 16),
      ),
    );
