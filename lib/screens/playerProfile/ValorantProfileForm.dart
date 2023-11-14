import 'package:bottle_ver2/utilities/json/writeJSONToFile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/tournamentModels/playerProvider.dart';

class ValorantProfileForm extends StatefulWidget {
  ValorantProfileForm({super.key});

  @override
  State<ValorantProfileForm> createState() => _ValorantProfileFormState();
}

class _ValorantProfileFormState extends State<ValorantProfileForm> {
  final TextEditingController _usernameController = TextEditingController();

  String? _selectedRank;
  String? _selectedAgent;
  String? _selectedRole;
  List<String> _availableRanks = [
    'Iron 1',
    'Iron 2',
    'Iron 3',
    'Bronze 1',
    'Bronze 2',
    'Bronze 3',
    'Silver 1',
    'Silver 2',
    'Silver 3',
    'Gold 1',
    'Gold 2',
    'Gold 3',
    'Platinum 1',
    'Platinum 2',
    'Platinum 3',
    'Diamond 1',
    'Diamond 2',
    'Diamond 3',
    'Immortal 1',
    'Immortal 2',
    'Immortal 3',
    'Radiant'
  ];
  List<String> _availableAgents = [
    'Brimstone',
    'Phoenix',
    'Sage',
    'Sova',
    'Viper',
    'Cypher',
    'Reyna',
    'Killjoy',
    'Breach',
    'Omen',
    'Jett',
    'Raze',
    'Skye',
    'Yoru',
    'Astra',
    'KAY/O',
    'Chamber',
    'Neon',
    'Fade',
    'Harbor',
    'Gekko',
    'Deadlock',
    'Iso'
  ];
  List<String> _availableRoles = [
    'Duelist',
    'Initiator',
    'Sentinel',
    'Controller'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(labelText: 'Enter RIOT Username'),
        ),
        SizedBox(height: 20),
        Text('Select Your Rank:', style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: _selectedRank,
          onChanged: (String? newValue) {
            setState(() {
              _selectedRank = newValue;
            });
          },
          items: _availableRanks.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text('Radiant'),
        ),
        SizedBox(height: 20),
        Text('Select Your Preferred Role:', style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: _selectedRole,
          onChanged: (String? newValue) {
            setState(() {
              _selectedRole = newValue;
            });
          },
          items: _availableRoles.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text('Controller'),
        ),
        SizedBox(height: 20),
        Text('Select Your Main:', style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: _selectedAgent,
          onChanged: (String? newValue) {
            setState(() {
              _selectedAgent = newValue;
            });
          },
          items: _availableAgents.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text('Omen'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            // Here you would normally handle the form submission

            Provider.of<PlayerProvider>(context, listen: false)
                .createValorantPlayer(
              _usernameController.text,
              rank: _selectedRank,
              mainAgent: _selectedAgent,
            );
          },
          child: Text('Create VALORANT Profile'),
        ),
        ElevatedButton(
            onPressed: () async {
              loadData('key1');
              // print(prefs.getString("key1"));
            },
            child: Text("Get local data"))
      ],
    );
  }
}
