import 'package:bottle_ver2/tournamentFlow/views/createTournament_nBracket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tournamentModels/round.dart';

import '../../controllers/providers/nBracketTournamentDataProvider.dart';
import 'matchInputWidget.dart';
import 'winnerInputWidget.dart';

class BracketRounds extends StatefulWidget {
  final Map<String, dynamic> bracket;

  BracketRounds({
    required this.bracket,
  });

  @override
  State<BracketRounds> createState() => _BracketRoundsState();
}

class _BracketRoundsState extends State<BracketRounds> {
  List<Widget> roundWidgets = [];

  generateBracketRoundWidgets() {
    int roundIndex = -1;

    widget.bracket["rounds"].forEach((round) {
      roundIndex++;
      int matchIndex = -1;
      roundWidgets.add(Container(
        margin: EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(round["noOfMatches"], (index) {
            matchIndex++;

            return MatchInputWidget(
              matchIndex: matchIndex,
              roundIndex: roundIndex,
              bracketIndex: widget.bracket["bracketIndex"],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WinnerInputData(
            bracketIndex: widget.bracket["bracketIndex"],
          ),
        ],
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    nBracketTournamentDataProvider tournamentDataProvider =
    context.watch<nBracketTournamentDataProvider>();
    // generateBracketRoundWidgets();

    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
              List.generate(widget.bracket["rounds"].length, (index) {
                var round = widget.bracket["rounds"][index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(round["noOfMatches"], (matchIndex) {
                    // return Column(
                    //   children: [
                    //     Text(round["matches"][index]["participantA"]["name"]),
                    //     Text(round["matches"][index]["participantB"]["name"]),
                    //   ],
                    // );
                    return MatchInputWidget(
                      matchIndex: matchIndex,
                      roundIndex: index,
                      bracketIndex: widget.bracket["bracketIndex"],
                      participantA:
                      round["matches"][matchIndex]["participantA"] != null
                          ? round["matches"][matchIndex]["participantA"]
                          .toString()
                          : "",
                      participantB:
                      round["matches"][matchIndex]["participantB"] != null
                          ? round["matches"][matchIndex]["participantB"]
                          .toString()
                          : "",
                    );
                  }),
                );
              })),
        )
      ],
    );
  }
}
