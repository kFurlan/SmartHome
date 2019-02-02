import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

class RoomModel extends Equatable {
  final String id;
  final String name;
  final String type;

  RoomModel({@required this.id, @required this.name, @required this.type});
}
