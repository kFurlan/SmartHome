import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:smarthome/models/room_model.dart';

abstract class RoomEvent extends Equatable {
  RoomEvent([List props = const []]) : super(props);
}

class InsertRoom extends RoomEvent {
  final String name;
  final String type;
  InsertRoom({
    @required this.name,
    @required this.type,
  }) : super([name, type]);
}

class DeleteRoom extends RoomEvent {
  final String id;
  DeleteRoom({
    @required this.id,
  }) : super([id]);
}

class EditRoom extends RoomEvent {
  final RoomModel model;
  EditRoom({@required this.model}) : super([model]);
}
