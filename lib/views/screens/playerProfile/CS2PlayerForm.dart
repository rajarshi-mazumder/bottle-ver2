import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tournamentModels/playerProvider.dart';

// import '../../models/tournamentModels/playerProvider.dart';

class CS2ProfileForm extends StatefulWidget {
  CS2ProfileForm({super.key});

  @override
  State<CS2ProfileForm> createState() => _CS2ProfileFormState();
}

class _CS2ProfileFormState extends State<CS2ProfileForm> {
  final TextEditingController _usernameController = TextEditingController();

  String? _selectedRank;
  String? _selectedSpecialization;
  List<String> _availableRanks = [
    'Silver I',
    'Silver II',
    'Silver III',
    'Silver IV',
    'Silver Elite',
    'Silver Elite Master',
    'Gold Nova I',
    'Gold Nova II',
    'Gold Nova III',
    'Gold Nova Master',
    'Master Guardian I',
    'Master Guardian II',
    'Master Guardian Elite',
    'Distinguished Master Guardian',
    'Legendary Eagle',
    'Legendary Eagle Master',
    'Supreme Master First Class',
    'The Global Elite',
  ];
  List<String> _availableSpecializations = [
    'Rifle',
    'Sniper',
    'Support',
    'Entry Fragger',
    'IGL (In-Game Leader)',
    // ... add any other specializations relevant to CS2
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(labelText: 'Enter Steam Username'),
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
          hint: Text('Select Rank'),
        ),
        SizedBox(height: 20),
        Text('Select Your Specialization:', style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: _selectedSpecialization,
          onChanged: (String? newValue) {
            setState(() {
              _selectedSpecialization = newValue;
            });
          },
          items: _availableSpecializations
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text('Select Specialization'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Here you would normally handle the form submission

            Provider.of<PlayerProvider>(context, listen: false).createCS2Player(
                _usernameController.text,
                rank: _selectedRank,
                specialization: _selectedSpecialization);
          },
          child: Text('Create CS2 Profile'),
        ),
      ],
    );
  }
}
