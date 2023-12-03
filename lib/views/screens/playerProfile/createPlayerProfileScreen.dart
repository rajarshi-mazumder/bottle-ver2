import 'package:bottle_ver2/models/tournamentModels/playerProvider.dart';
// import 'package:bottle_ver2/screens/playerProfile/CS2PlayerForm.dart';
// import 'package:bottle_ver2/screens/playerProfile/ValorantProfileForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CS2PlayerForm.dart';
import 'ValorantProfileForm.dart';

class PlayerProfileForm extends StatefulWidget {
  @override
  _PlayerProfileFormState createState() => _PlayerProfileFormState();
}

class _PlayerProfileFormState extends State<PlayerProfileForm> {
  String _selectedGame = 'VALORANT';

  final List<String> _gameTitles = [
    'VALORANT',
    'CS2',
    'Overwatch 2',
    'Apex Legends'
  ];

  void _onGameChanged(String? value) {
    if (value != null) {
      setState(() {
        _selectedGame = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Player Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Select a Game:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedGame,
              onChanged: _onGameChanged,
              items: _gameTitles.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            if (_selectedGame == 'VALORANT') ValorantProfileForm(),
            if (_selectedGame == 'CS2') CS2ProfileForm(),
          ],
        ),
      ),
    );
  }
}
