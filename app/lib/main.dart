import 'package:flutter/material.dart';
import 'package:smarthome/pages/profile_info.dart';
import 'package:smarthome/pages/room_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPageIndex = 0;

  List<Widget> pages;
  Widget currentPage;

  RoomInfoPage roomInfoPage;
  ProfileInfoPage profileInfoPage;

  @override
  void initState() {
    this.roomInfoPage = RoomInfoPage();
    this.profileInfoPage = ProfileInfoPage();
    this.pages = [
      roomInfoPage,
      profileInfoPage,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.pages[this.currentPageIndex], // Sincroniza com a página atual
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.currentPageIndex, // Sincroniza com a página atual
        type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          setState(() {
            this.currentPageIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Cômodo'),
            backgroundColor: Colors.orange,
            icon: Icon(Icons.airline_seat_individual_suite),
          ),
          BottomNavigationBarItem(
            title: Text('Perfil'),
            backgroundColor: Colors.blue,
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
