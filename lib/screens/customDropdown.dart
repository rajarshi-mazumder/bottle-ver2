import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Valorant Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ParticipantInputForm(),
    );
  }
}

class ParticipantInputForm extends StatefulWidget {
  List<String> _selectedParticipants = [];

  @override
  _ParticipantInputFormState createState() => _ParticipantInputFormState();
}

class _ParticipantInputFormState extends State<ParticipantInputForm> {

  String? _participantType = 'Team'; // Default to 'Team'
  int _maxParticipants = 0;

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
  Widget build(BuildContext context) {
    return

      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Number of Participants (Max 16)',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                int? number = int.tryParse(value);
                if (number != null && number <= 16) {
                  setState(() {
                    _maxParticipants = number;
                    widget._selectedParticipants
                        .clear(); // Reset selections if number changes
                  });
                }
              },
            ),
            DropdownButton<String>(
              value: _participantType,
              items: <String>['Team', 'Player'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _participantType = newValue;
                  widget._selectedParticipants
                      .clear(); // Reset selections when type changes
                });
              },
            ),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                var options = _participantType == 'Team'
                    ? _teamsWithImages.keys
                    : _playersWithImages.keys;
                return options.where((option) =>
                    option
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()));
              },
              onSelected: (String selection) {
                if (!widget._selectedParticipants.contains(selection) &&
                    widget._selectedParticipants.length < _maxParticipants) {
                  setState(() {
                    widget._selectedParticipants.add(selection);
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget._selectedParticipants.length,
                itemBuilder: (context, index) {
                  String participant = widget._selectedParticipants[index];
                  String imageUrl = _participantType == 'Team'
                      ? _teamsWithImages[participant]!
                      : _playersWithImages[participant]!;
                  return ListTile(
                    leading: Image.network(imageUrl, width: 50, height: 50),
                    title: Text(participant),
                    trailing: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          widget._selectedParticipants.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    ;
  }
}
