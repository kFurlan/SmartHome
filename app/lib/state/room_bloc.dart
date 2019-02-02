import 'package:bloc/bloc.dart';
import 'package:smarthome/models/room_model.dart';
import 'package:uuid/uuid.dart';
import 'room_event.dart';
import 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  List<RoomModel> rooms = [];

  @override
  RoomState get initialState => RoomEmpty();

  @override
  Stream<RoomState> mapEventToState(
      RoomState currentState, RoomEvent event) async* {
    if (event is InsertRoom) {
      final model =
          RoomModel(id: Uuid().v1(), name: event.name, type: event.type);
      rooms.add(model);
    }
    if (event is DeleteRoom) {
      rooms.removeWhere((element) => element.id == event.id);
    }
    if (rooms.isNotEmpty) {
      yield RoomLoaded();
    } else {
      yield RoomEmpty();
    }
  }
}
