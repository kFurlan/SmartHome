import 'package:flutter/material.dart';
import 'package:smarthome/pages/room_create.dart';
import 'package:smarthome/pages/room_edit.dart';
import 'dart:math';

class RoomInfoPage extends StatefulWidget {
  @override
  _RoomCreatePageState createState() => _RoomCreatePageState();
}

class _RoomCreatePageState extends State<RoomInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, index) {
            return Card(
              child: Column(
                children: <Widget>[
                  // Image.network('https://lorempixel.com/400/200/city'),
                  ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.orange,
                    ),
                    title: Text('Quarto ${index + 1}'),
                    subtitle:
                        Text('${Random().nextInt(6)} dispositivos cadastrados'),
                    trailing: ButtonTheme.bar(
                      child: FlatButton(
                        splashColor: Colors.orangeAccent[100],
                        highlightColor: Colors.orangeAccent[100],
                        child: Text(
                          'EDITAR',
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RoomEditPage()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Adicionar um novo cômodo',
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RoomCreatePage()));
        },
      ),
    );
  }
}
