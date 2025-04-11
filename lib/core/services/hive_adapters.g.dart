// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class ToDoListModelAdapter extends TypeAdapter<ToDoListModel> {
  @override
  final int typeId = 0;

  @override
  ToDoListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoListModel(
      title: fields[0] as String,
      description: fields[1] as String,
      color: fields[2] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoListModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
