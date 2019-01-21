import 'package:flutter/material.dart';

class RoomEditPage extends StatefulWidget {
  @override
  RoomEditPageState createState() => RoomEditPageState();
}

class RoomEditPageState extends State<RoomEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Cômodo', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.black,
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
