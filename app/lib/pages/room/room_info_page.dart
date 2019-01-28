import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smarthome/pages/room/room_create_page.dart';
import 'package:smarthome/pages/room/room_edit_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/state/room_state.dart';
import 'package:smarthome/state/room_bloc.dart';
import 'package:smarthome/state/room_event.dart';

class RoomInfoPage extends StatefulWidget {
  @override
  _RoomCreatePageState createState() => _RoomCreatePageState();
}

class _RoomCreatePageState extends State<RoomInfoPage> {
  RoomBloc _roomBloc;

  @override
  void initState() {
    _roomBloc = BlocProvider.of(context);
    super.initState();
  }

  @override
  void dispose() {
    _roomBloc.dispose();
    super.dispose();
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
                      bloc: _roomBloc, child: RoomCreatePage()),
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
              itemCount: _roomBloc.rooms.length,
              itemBuilder: (BuildContext context, index) {
                return _buildRoomListItem(index, context);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildRoomListItem(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Card(
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Image.network('https://lorempixel.com/400/400'),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Quarto ${_roomBloc.rooms[index].name}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text('${Random().nextInt(6)} de 6 dispositivos ligados')
                      ],
                    ),
                  ),
                  Flexible(
                    child: ButtonTheme.bar(
                      child: OutlineButton(
                        child: Text(
                          'EDITAR',
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomEditPage(),
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
      ),
    );
  }
}
