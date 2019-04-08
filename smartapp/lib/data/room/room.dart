import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'room.g.dart';

abstract class Room implements Built<Room, RoomBuilder> {
  String get id;

  String get name;

  String get type;

  Room._();

  factory Room([updates(RoomBuilder b)]) = _$Room;

  static Serializer<Room> get serializer => _$roomSerializer;
}
