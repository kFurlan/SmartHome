import 'package:flutter/material.dart';
import 'package:smarthome/pages/profile_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileInfoPage(),
    );
  }
}