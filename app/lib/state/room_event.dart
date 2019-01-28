import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

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
  final String name;
  final String type;
  DeleteRoom({
    @required this.name,
    @required this.type,
  }) : super([name, type]);
}
