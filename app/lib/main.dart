import 'package:flutter/material.dart';
import 'package:smarthome/pages/profile/profile_info_page.dart';
import 'package:smarthome/pages/room/room_info_page.dart';
import 'package:smarthome/state/room_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  RoomBloc _roomBloc;

  List<Widget> pages;
  Widget currentPage;

  Widget roomInfoPage;
  Widget profileInfoPage;

  @override
  void initState() {
    this._roomBloc = RoomBloc();
    this.roomInfoPage = BlocProvider<RoomBloc>(
      bloc: this._roomBloc,
      child: RoomInfoPage(),
    );
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
            title: Text('Cômodos'),
            backgroundColor: Colors.blue,
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
