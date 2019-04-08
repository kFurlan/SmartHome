import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:smartapp/data/device/device.dart';

abstract class DeviceEvent extends Equatable {
  DeviceEvent([List props = const []]) : super(props);
}

class InsertDevice extends DeviceEvent {
  final String name;
  final String type;

  InsertDevice({
    @required this.name,
    @required this.type,
  }) : super([name, type]);
}

class DeleteDevice extends DeviceEvent {
  final String id;

  DeleteDevice({
    @required this.id,
  }) : super([id]);
}

class EditDevice extends DeviceEvent {
  final Device model;

  EditDevice({@required this.model}) : super([model]);
}
