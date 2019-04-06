import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartapp/blocs/room/room_bloc.dart';
import 'package:smartapp/ui/device_create_page.dart';
import 'package:smartapp/ui/room/room_info_page.dart';
import 'package:smartapp/ui/user_profile/profile_info_page.dart';

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
  List<Widget> pages = [
    RoomInfoPage(),
    ProfileInfoPage(),
  ];

  @override
  void initState() {
    this.pages =  [
      BlocProvider<RoomBloc>(
        bloc: RoomBloc(),
        child: RoomInfoPage()
      ),
      DeviceCreatePage(),
      ProfileInfoPage(),
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
            title: Text('Dispositivos'),
            backgroundColor: Colors.blue,
            icon: Icon(Icons.important_devices),
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
