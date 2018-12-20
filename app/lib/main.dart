import 'package:flutter/material.dart';
import 'registro.dart';
/*import 'package:flutter_app/LoginPage.dart';*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTitle = "Smart Home";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: Colors.blue[800],
          elevation: 0,
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.blue[800],
                Colors.blue[300],
                Colors.blue[200],
                Colors.blue[100],
              ],
            )),
            child: Home()),
      ),
    );
  }
}

