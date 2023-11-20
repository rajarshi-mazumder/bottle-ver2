import 'package:bottle_ver2/models/tournamentModels/teamsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/tournamentModels/playerProvider.dart';

class CreateTeamForm extends StatefulWidget {
  const CreateTeamForm({super.key});

  @override
  State<CreateTeamForm> createState() => _CreateTeamFormState();
}

class _CreateTeamFormState extends State<CreateTeamForm> {
  String _selectedGame = 'VALORANT';

  final List<String> _gameTitles = [
    'VALORANT',
    'CS2',
    'Overwatch 2',
    'Apex Legends'
  ];

  final TextEditingController _titleController = TextEditingController();

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
        title: Text('Create Team'),
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
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Team Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Here you would normally handle the form submission

                Provider.of<TeamsProvider>(context, listen: false)
                    .createUnlistedGameTeam(
                  _titleController.text,
                );
              },
              child: Text('Create Team'),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
