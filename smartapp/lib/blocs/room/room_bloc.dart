import 'package:bloc/bloc.dart';
import 'package:smartapp/blocs/room/room_event.dart';
import 'package:smartapp/blocs/room/room_state.dart';
import 'package:smartapp/data/room/room.dart';

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
    if (rooms.isEmpty) {
      yield RoomEmpty();
    } else {
      yield RoomLoaded();
    }
  }
}
