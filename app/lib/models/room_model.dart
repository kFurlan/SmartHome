import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class RoomModel extends Equatable {
  final String name;
  final String type;

  RoomModel({@required this.name, @required this.type});
}
