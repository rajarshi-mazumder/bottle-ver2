import 'package:bottle_ver2/screens/customDropdown.dart';
import 'package:flutter/material.dart';

class TournamentForm extends StatefulWidget {
  @override
  _TournamentFormState createState() => _TournamentFormState();
}

class _TournamentFormState extends State<TournamentForm> {
  String _tournamentType = 'SingleElimination';

  String _bracketCount = '';
  List<String> _teamNames = [];
  String _currentTeam = '';

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
            Expanded(child: ParticipantInputForm()),
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
