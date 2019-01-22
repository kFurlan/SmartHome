import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smarthome/pages/room_create.dart';
import 'package:smarthome/pages/room_edit.dart';

class RoomInfoPage extends StatefulWidget {
  @override
  _RoomCreatePageState createState() => _RoomCreatePageState();
}

class _RoomCreatePageState extends State<RoomInfoPage> {
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
                  builder: (context) => RoomCreatePage(),
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, index) {
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
                          child:
                              Image.network('https://lorempixel.com/400/400'),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Quarto ${index + 1}',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              Text(
                                  '${Random().nextInt(6)} de 6 dispositivos ligados')
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
        },
      ),
    );
  }
}
