// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capital_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CapitalModelAdapter extends TypeAdapter<CapitalModel> {
  @override
  final int typeId = 0;

  @override
  CapitalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CapitalModel(
      amount: fields[0] as int,
      period: fields[1] as int,
      investments: (fields[2] as List).cast<InvestmentModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CapitalModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.period)
      ..writeByte(2)
      ..write(obj.investments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CapitalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
