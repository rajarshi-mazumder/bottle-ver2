import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class GameProfileRightSection extends StatefulWidget {
  const GameProfileRightSection({super.key});

  @override
  State<GameProfileRightSection> createState() =>
      _GameProfileRightSectionState();
}

class _GameProfileRightSectionState extends State<GameProfileRightSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 110, horizontal: 100),
        decoration: BoxDecoration(
            // color: Colors.blue,
            ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [secondaryColor, bgPrimaryColor]),
                  ),
                  width: 800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.pink)),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: DropdownButton<String>(
                            value: 'Valorant',
                            // The selected value
                            onChanged: (String? newValue) {
                              // Handle dropdown item selection here
                              print('Selected: $newValue');
                            },
                            items: <String>[
                              'Valorant',
                              'CS 2',
                              'Apex Legends',
                              'Overwatch',
                              'League of Legends',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: Colors
                                        .blue, // Set the text color for dropdown items
                                  ),
                                ),
                              );
                            }).toList(),
                            style: TextStyle(
                              color: Colors
                                  .red, // Set the text color for the button
                            ),

                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.red, // Set the dropdown icon color
                            ),

                            dropdownColor: Colors
                                .white, // Set the dropdown background color
                          ),
                        ),
                      ),
                      Container(
                        height: 500,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
