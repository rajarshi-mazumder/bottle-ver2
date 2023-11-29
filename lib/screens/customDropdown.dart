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
      // home: ParticipantInputForm(),
    );
  }
}

class ParticipantInputForm extends StatefulWidget {
  ParticipantInputForm(
      {required this.participantOptions, this.getSelectedParticipants});

  List<String> _selectedParticipants = [];
  List<String> participantOptions;

  Function(List<String>, int participantsLength)? getSelectedParticipants;

  @override
  _ParticipantInputFormState createState() => _ParticipantInputFormState();
}

class _ParticipantInputFormState extends State<ParticipantInputForm> {
  String? _participantType = 'Team'; // Default to 'Team'
  int _maxParticipants = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              var options = widget.participantOptions;
              return options.where((option) => option
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase()));
            },
            onSelected: (String selection) {
              if (!widget._selectedParticipants.contains(selection) &&
                  widget._selectedParticipants.length < _maxParticipants) {
                setState(() {
                  widget._selectedParticipants.add(selection);
                  if (widget.getSelectedParticipants != null)
                    widget.getSelectedParticipants!(
                        widget._selectedParticipants, _maxParticipants);
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
                String imageUrl = '';
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
    );
  }
}
