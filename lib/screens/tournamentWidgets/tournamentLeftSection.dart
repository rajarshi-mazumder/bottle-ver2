import 'package:bottle_ver2/screens/tournamentWidgets/TournamentTile.dart';
import 'package:bottle_ver2/themes/spacing.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';

class TournamentLeftSection extends StatefulWidget {
  TournamentLeftSection({super.key, this.cardLength = "long"});

  String cardLength;

  @override
  State<TournamentLeftSection> createState() => _TournamentLeftSectionState();
}

class _TournamentLeftSectionState extends State<TournamentLeftSection> {
  @override
  Widget build(BuildContext context) {
    CustomSpacing customSpacing = CustomSpacing(context: context);
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: customSpacing.leftSideWidth, maxHeight: 600),
        child: SingleChildScrollView(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [secondaryColor, bgPrimaryColor]),
              ),
              height: widget.cardLength == "long" ? 500 : 100,
              width: customSpacing.leftSideWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Tournaments",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          title: RichText(
                            text: TextSpan(
                              text:
                                  "Find tournaments happening near you, and participate with your own team!",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: tournaments.length >= 3
                                ? 3
                                : tournaments.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(tournaments[index]['title']),
                                    trailing:
                                        Text(tournaments[index]['organizer']),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          tournaments[index]['date'],
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: const Divider(
                                      thickness: 1,
                                    ),
                                  ), // Divider
                                  SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: bgSecondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.centerLeft, child: Text("Hubs")),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: bgSecondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Teams")),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
