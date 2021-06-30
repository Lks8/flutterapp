// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityAdapter extends TypeAdapter<City> {
  @override
  final int typeId = 1;

  @override
  City read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return City(
      customName: fields[0] as String,
      name: fields[1] as String,
      temperature: fields[2] as int,
      minTemperature: fields[3] as int,
      maxTemperature: fields[4] as int,
      pressure: fields[5] as int,
      humidity: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, City obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.customName)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.temperature)
      ..writeByte(3)
      ..write(obj.minTemperature)
      ..writeByte(4)
      ..write(obj.maxTemperature)
      ..writeByte(5)
      ..write(obj.pressure)
      ..writeByte(6)
      ..write(obj.humidity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
