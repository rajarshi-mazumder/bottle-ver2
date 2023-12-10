import 'package:bottle_ver2/tournamentFlow/views/nBracketTournamentWidgets/postBracketMatchWidget.dart';
import 'package:bottle_ver2/tournamentFlow/views/createTournament_nBracket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tournamentModels/round.dart';
import '../../controllers/providers/nBracketTournamentDataProvider.dart';
import 'nBracketMatchWidget.dart';
import 'nBracketWinnerWidget.dart';

class PostBracketRounds extends StatefulWidget {
  Map postBracketRounds;

  PostBracketRounds({
    required this.postBracketRounds,
  });

  @override
  State<PostBracketRounds> createState() => _PostBracketRoundsState();
}

class _PostBracketRoundsState extends State<PostBracketRounds> {
  List<Widget> roundWidgets = [];

  generateBracketRoundWidgets() {
    int roundIndex = -1;

    widget.postBracketRounds["rounds"].forEach((round) {
      roundIndex++;
      int matchIndex = -1;

      roundWidgets.add(Container(
        margin: EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(round["noOfMatches"], (index) {
            matchIndex++;

            bool isMatchDecided = false;
            if (round["matches"]?[index]["participantA"] != null &&
                round["matches"]?[index]["participantB"] != null)
              isMatchDecided = true;

            return PostBracketMatchWidget(
              matchIndex: matchIndex,
              roundIndex: roundIndex,
              isMatchDecided: isMatchDecided,
              participantA: round["matches"][index]["participantA"] != null
                  ? round["matches"][index]["participantA"].toString()
                  : "",
              participantB: round["matches"][index]["participantB"] != null
                  ? round["matches"][index]["participantB"].toString()
                  : "",
            );
          }),
        ),
      ));
      ;
    });
    roundWidgets.add(Container(
      width: 100,
      child: NBracketWinnerWidget(
        bracketIndex: 0,
        winnerType: "postBracketWinner",
      ),
    ));
  }

  @override
  void initState() {
    super.initState();

    generateBracketRoundWidgets();
  }

  @override
  Widget build(BuildContext context) {
    nBracketTournamentDataProvider tournamentDataProvider =
        context.watch<nBracketTournamentDataProvider>();

    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
              List.generate(widget.postBracketRounds["rounds"].length, (index) {
            var round = widget.postBracketRounds["rounds"][index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(round["noOfMatches"], (matchIndex) {
                bool isMatchDecided = false;
                if (round["matches"]?[matchIndex]["participantA"] != null &&
                    round["matches"]?[matchIndex]["participantB"] != null)
                  isMatchDecided = true;

                return PostBracketMatchWidget(
                  matchIndex: matchIndex,
                  roundIndex: index,
                  isMatchDecided: isMatchDecided,
                  participantA: round["matches"][matchIndex]["participantA"] !=
                          null
                      ? round["matches"][matchIndex]["participantA"].toString()
                      : "",
                  participantB: round["matches"][matchIndex]["participantB"] !=
                          null
                      ? round["matches"][matchIndex]["participantB"].toString()
                      : "",
                );
              }),
            );
          })),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: NBracketWinnerWidget(
              bracketIndex: 0,
              winnerType: "postBracketWinner",
            ),
          ),
        )
      ],
    );
  }
}
