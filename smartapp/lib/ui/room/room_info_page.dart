import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartapp/blocs/room/room_bloc.dart';
import 'package:smartapp/blocs/room/room_event.dart';
import 'package:smartapp/blocs/room/room_state.dart';
import 'package:smartapp/data/room/room.dart';
import 'package:smartapp/ui/room/room_create_page.dart';
import 'package:smartapp/ui/room/room_edit_page.dart';

class RoomInfoPage extends StatefulWidget {
  @override
  _RoomCreatePageState createState() => _RoomCreatePageState();
}

class _RoomCreatePageState extends State<RoomInfoPage> {
  RoomBloc _roomBloc;

  @override
  void initState() {
    _roomBloc = BlocProvider.of<RoomBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cômodos'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<RoomBloc>(
                        bloc: _roomBloc,
                        child: RoomCreatePage(),
                      ),
                ),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<RoomEvent, RoomState>(
        bloc: _roomBloc,
        builder: (BuildContext context, RoomState state) {
          if (state is RoomEmpty) {
            return Center(
              child: Text(
                'Nenhum cômodo cadastrado.',
                style: TextStyle(),
              ),
            );
          } else if (state is RoomLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: _roomBloc.rooms.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 2.0),
                  child: _buildRoomListItem(_roomBloc.rooms[index], context),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'Erro ao carregar os cômodos.',
                style: TextStyle(
                  fontSize: 48.0,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildRoomListItem(Room model, BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        children: <Widget>[
          Container(
            height: 90.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FittedBox(
                  child: Placeholder(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${model.name}',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        Text('${model.type}'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: ButtonTheme.bar(
                    child: OutlineButton(
                      child: Text(
                        'EDITAR',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider<RoomBloc>(
                                  bloc: _roomBloc,
                                  child: RoomEditPage(model: model),
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
