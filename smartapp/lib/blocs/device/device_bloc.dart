import 'package:bloc/bloc.dart';
import 'package:smartapp/blocs/device/device_event.dart';
import 'package:smartapp/blocs/device/device_state.dart';
import 'package:smartapp/data/device/device.dart';
import 'package:uuid/uuid.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  List<Device> devices = [];
  Uuid uuid = Uuid();

  @override
  DeviceState get initialState => DeviceEmpty();

  @override
  Stream<DeviceState> mapEventToState(
      DeviceState currentState, DeviceEvent event) async* {
    if (event is InsertDevice) {
      final model = Device((b) => b
        ..id = uuid.v1()
        ..name = event.name
        ..type = event.type);

      devices.add(model);
    } else if (event is DeleteDevice) {
      devices.removeWhere((element) => element.id == event.id);
    } else if (event is EditDevice) {
      final where =
          devices.indexWhere((element) => element.id == event.model.id);
      devices[where] = event.model;
    }
    if (devices.isEmpty) {
      yield DeviceEmpty();
    } else {
      yield DeviceLoaded();
    }
  }
}
