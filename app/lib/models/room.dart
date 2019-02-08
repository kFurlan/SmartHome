import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'room.g.dart';

abstract class Room implements Built<Room, RoomBuilder> {
  String get id;
  String get name;
  String get type;
  Room._();
  factory Room.create({
    @required String name,
    @required String type,
  }) {
    return _$Room._(
      id: Uuid().v1(),
      name: name,
      type: type,
    );
  }
  factory Room.withId({
    @required String id,
    @required String name,
    @required String type,
  }) {
    return _$Room._(
      id: id,
      name: name,
      type: type,
    );
  }
  factory Room([updates(RoomBuilder b)]) = _$Room;
  static Serializer<Room> get serializer => _$roomSerializer;
}
