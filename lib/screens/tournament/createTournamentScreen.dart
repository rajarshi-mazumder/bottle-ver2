import 'package:bottle_ver2/models/tournamentModels/tournamentModels.dart';
import 'package:bottle_ver2/screens/customDropdown.dart';
import 'package:flutter/material.dart';

import '../../tournamentOperations/tournamentScreenWidgets/doubleElimTournamentUtilities/winnerLoserRoundHashMap.dart';

class TournamentForm extends StatefulWidget {
  final Map<String, String> _teamsWithImages = {
    'Fnatic': 'https://example.com/fnatic_logo.jpg',
    'LOUD': 'https://example.com/loud_logo.jpg',
    'Paper Rex': 'https://example.com/paper_rex_logo.jpg',
    'EDward Gaming': 'https://example.com/edward_gaming_logo.jpg',
    'FunPlus Phoenix': 'https://example.com/funplus_phoenix_logo.jpg',
    'Bilibili Gaming': 'https://example.com/bilibili_gaming_logo.jpg',
    'ZETA DIVISION': 'https://example.com/zeta_division_logo.jpg',
    'KRÜ Esports': 'https://example.com/kru_esports_logo.jpg',
    'Giants': 'https://example.com/giants_logo.jpg',
    'T1': 'https://example.com/t1_logo.jpg',
    'FUT Esports': 'https://example.com/fut_esports_logo.jpg',
    'Natus Vincere': 'https://example.com/natus_vincere_logo.jpg',
    'DRX': 'https://example.com/drx_logo.jpg',
    'Team Liquid': 'https://example.com/team_liquid_logo.jpg',
    'NRG': 'https://example.com/nrg_logo.jpg',
    'Evil Geniuses': 'https://example.com/evil_geniuses_logo.jpg'
  };

  final Map<String, String> _playersWithImages = {
    'yay': 'https://example.com/yay_image.jpg',
    'Derke': 'https://example.com/derke_image.jpg',
    'Jinggg': 'https://example.com/jinggg_image.jpg',
    'Chronicle': 'https://example.com/chronicle_image.jpg',
    'Asuna': 'https://example.com/asuna_image.jpg',
    'SUYGETSU': 'https://example.com/suygetsu_image.jpg',
    'TenZ': 'https://example.com/tenz_image.jpg',
    'Aspas': 'https://example.com/aspas_image.jpg',
    'ScreaM': 'https://example.com/scream_image.jpg',
    'Leo': 'https://example.com/leo_image.jpg'
  };

  @override
  _TournamentFormState createState() => _TournamentFormState();
}

class _TournamentFormState extends State<TournamentForm> {
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
    print(
        'Tournament Created: $_tournamentType with ${_teamNames} teams and bracket count: $_bracketCount');
    Tournament t = Tournament.createTournament(
        type: "double_elimination",
        participantType: participantType,
        participantsLength: 16,
        winnerLoserHashMap: winnerLoserRoundHashMap_16_teams);
    print("BANKKK ${t}");
  }

  @override
  void initState() {
    super.initState();
    participantOptions = participantType == 'Team'
        ? widget._teamsWithImages.keys.toList()
        : widget._playersWithImages.keys.toList();
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
                print("UKKK $selectedParticipants, ${noOfparticipants}");
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
