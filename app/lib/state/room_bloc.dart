import 'package:bloc/bloc.dart';
import 'package:smarthome/models/room.dart';
import 'room_event.dart';
import 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  List<Room> rooms = [];

  @override
  RoomState get initialState => RoomEmpty();

  @override
  Stream<RoomState> mapEventToState(
      RoomState currentState, RoomEvent event) async* {
    if (event is InsertRoom) {
      final model = Room.create(name: event.name, type: event.type);
      rooms.add(model);
    } else if (event is DeleteRoom) {
      rooms.removeWhere((element) => element.id == event.id);
    } else if (event is EditRoom) {
      final where = rooms.indexWhere((element) => element.id == event.model.id);
      rooms[where] = event.model;
    }
    if (rooms.isNotEmpty) {
      yield RoomLoaded();
    } else {
      yield RoomEmpty();
    }
  }
}
