// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doubleElimTournament.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoubleElimTournamentHiveAdapter
    extends TypeAdapter<DoubleElimTournament_Hive> {
  @override
  final int typeId = 0;

  @override
  DoubleElimTournament_Hive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoubleElimTournament_Hive(
      name: fields[0] as String?,
      tournamentData: (fields[1] as Map).cast<String, dynamic>(),
      id: fields[2] as int,
      participantType: fields[4] as String,
      participants: (fields[3] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, DoubleElimTournament_Hive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.tournamentData)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.participants)
      ..writeByte(4)
      ..write(obj.participantType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoubleElimTournamentHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
