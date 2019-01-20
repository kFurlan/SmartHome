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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPageIndex = 1;

  List<Widget> pages;
  Widget currentPage;

  ProfileInfoPage profileInfoPage;

  @override
  void initState() {
    this.profileInfoPage = ProfileInfoPage();
    this.pages = [
      Placeholder(),
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
            title: Text('Placeholder'),
            backgroundColor: Colors.orange,
            icon: Icon(Icons.calendar_today),
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
