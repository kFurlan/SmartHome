import 'package:bloc/bloc.dart';
import 'package:smarthome/models/room_model.dart';
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
      rooms.add(RoomModel(
        name: event.name,
        type: event.type,
      ));
    }
    if (rooms.isNotEmpty) {
      yield RoomLoaded();
    } else {
      yield RoomEmpty();
    }
  }
}
