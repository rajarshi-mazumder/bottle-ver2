import 'package:bottle_ver2/tournamentFlow/views/createTournament_nBracket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tournamentModels/round.dart';

import '../../controllers/providers/nBracketTournamentDataProvider.dart';
import 'nBracketMatchWidget.dart';
import 'nBracketWinnerWidget.dart';

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
                return NBracketMatchWidget(
                  matchIndex: matchIndex,
                  roundIndex: index,
                  bracketIndex: widget.bracket["bracketIndex"],
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
              winnerType: "bracketWinner",
            ),
          ),
        )
      ],
    );
  }
}
