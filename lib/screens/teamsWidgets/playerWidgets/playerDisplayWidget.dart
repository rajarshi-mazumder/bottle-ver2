import 'package:bottle_ver2/screens/teamsWidgets/playerWidgets/playerStatItemWidgets.dart';
import 'package:flutter/material.dart';

import '../../../models/tournamentModels/player.dart';
import '../../../models/tournamentModels/tournamentModels.dart';

List<Player> players = [
  Player(
      name: "Yay",
      nationality: "flags/us.png",
      twitchLink: "yay@goat.twitch",
      twitterLink: "yay@x",
      mainAgent: "chamber"),
  Player(
      name: "FNS",
      nationality: "flags/ca.png",
      twitchLink: "fns@optic.twitch",
      twitterLink: "fns@x",
      mainAgent: "viper"),
  Player(
      name: "Marved",
      nationality: "flags/ca.png",
      twitchLink: "marved@optic.twitch",
      twitterLink: "marved@x",
      mainAgent: "omen"),
  Player(
      name: "Crashies",
      nationality: "flags/us.png",
      twitchLink: "crashies@optic.twitch",
      twitterLink: "crashies@x",
      mainAgent: "sova"),
  Player(
      name: "Victor",
      nationality: "flags/us.png",
      twitchLink: "victor@optic.twitch",
      twitterLink: "victor@x",
      mainAgent: "neon"),
];

class PlayerDisplayWidget extends StatelessWidget {
  PlayerDisplayWidget(
      {super.key,
      required this.name,
      required this.agentImgUrl,
      this.isMVP = false});

  String name;
  String agentImgUrl;
  bool isMVP;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      width: 250,
      child: Stack(children: [
        Positioned(
          top: 0,
          child: Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 1),
                      Color.fromRGBO(0, 0, 0, 0)
                    ])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
              agentImgUrl,
              width: 242,
              height: 256,
              fit: BoxFit.cover,
            ),
          ),
        ), // image
        Positioned(
          top: 0,
          child: Container(
            height: 150,
            width: 242,
            margin: EdgeInsets.only(left: 4, top: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 1),
                      Color.fromRGBO(0, 0, 0, 0)
                    ])),
          ),
        ), // inner square
        Positioned(
          bottom: 140,
          child: Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 1)
                  ]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 140,
            width: 250,
            padding: EdgeInsets.only(bottom: 4, left: 4, right: 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 1),
                    Color.fromRGBO(0, 0, 0, 0.7)
                  ]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 140,
            width: 242,
            margin: EdgeInsets.only(bottom: 4, left: 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 1),
                    Color.fromRGBO(0, 0, 0, 0.7)
                  ]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
          ),
        ),
        if (isMVP)
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              "MVP",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Colors.yellow, fontSize: 20),
            ),
          ),
        Positioned(
            top: 225,
            child: Container(
              constraints: BoxConstraints(minHeight: 50),
              width: 250,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PlayerStatTextItemCircular(),
                      PlayerStatImageItemCircular(
                        imageUrl: "valoRanks/immortal.png",
                      ),
                    ],
                  )
                ],
              ),
            )), // Player name
      ]),
    );
  }
}
