import 'package:bottle_ver2/models/tournamentModels/tournamentModels.dart';
import 'package:bottle_ver2/screens/customDropdown.dart';
import 'package:flutter/material.dart';

import '../../doubleElimTournamentScreen.dart';
import '../controllers/providers/doubleBracketTournamentDataProvider.dart';
import '../../tournamentOperations/tournamentScreenWidgets/doubleElimTournamentUtilities/winnerLoserRoundHashMap.dart';
import 'package:bottle_ver2/tournamentFlow/controllers/data/participantsData.dart';

class CreateTournament_DoubleElim extends StatefulWidget {
  CreateTournament_DoubleElim(
      {required this.participantPlayers, required this.participantTeams});

  Map<String, dynamic> participantTeams;
  Map<String, dynamic> participantPlayers;

  @override
  _CreateTournament_DoubleElimState createState() =>
      _CreateTournament_DoubleElimState();
}

class _CreateTournament_DoubleElimState
    extends State<CreateTournament_DoubleElim> {
  String _tournamentType = 'SingleElimination';

  String _bracketCount = '';
  List<String> _teamNames = [];
  String _currentTeam = '';
  String participantType = "Team";
  List<String> participantOptions = [];
  List<String> selectedParticipants = [];
  int noOfparticipants = 0;

  void _addTeam() {
    if (_currentTeam.isNotEmpty) {
      setState(() {
        _teamNames.add(_currentTeam);
        _currentTeam = '';
      });
    }
  }

  void _createTournament() {
    // Use the input to create tournament instance
    // This is where you would normally do something with the created tournament

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DoubleElimTournamentScreen(
                  participantsLength: 16,
                  // participants: selectedParticipants,
                  winnerLoserHashMap: winnerLoserRoundHashMap_16_teams,
                  winnersBracketMap: winnersBracketMap_16_participants,
                  losersBracketMap: losersBracketMap_16_participants,
                )));
  }

  @override
  void initState() {
    super.initState();
    participantOptions = participantType == 'Team'
        ? widget.participantTeams.keys.toList()
        : widget.participantPlayers.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Tournament'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: ParticipantInputForm(
              participantOptions: participantOptions,
              getSelectedParticipants:
                  (selectedParticipants, noOfParticipants) {
                this.selectedParticipants = selectedParticipants;
                this.noOfparticipants = noOfParticipants;
              },
            )),
            DropdownButton<String>(
              value: _tournamentType,
              onChanged: (String? newValue) {
                setState(() {
                  _tournamentType = newValue!;
                });
              },
              items: <String>[
                'SingleElimination',
                'DoubleElimination',
                'RoundRobin',
                'MultiBracket',
                'BattleRoyale',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Bracket Count'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _bracketCount = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Add Team'),
              onChanged: (value) {
                _currentTeam = value;
              },
              onSubmitted: (value) {
                _addTeam();
              },
            ),
            ElevatedButton(
              onPressed: _addTeam,
              child: Text('Add Team'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _teamNames.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(_teamNames[index]));
                },
              ),
            ),
            ElevatedButton(
              onPressed: _createTournament,
              child: Text(
                'Create Tournament',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
