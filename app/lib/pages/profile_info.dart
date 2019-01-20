import 'package:flutter/material.dart';

class ProfileInfoPage extends StatefulWidget {
  @override
  _ProfileInfoPageState createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 32.0,
                      backgroundColor: Colors.blue,
                    ),
                    trailing: OutlineButton(
                      child: Text('EDITAR PERFIL'),
                      onPressed: () {},
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Nome do Usuário',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  subtitle: Text('email@email.com'),
                ),
                Divider()
              ],
            ),
          ),
        ),
        bottomSheet: BottomNavigationBar(
          currentIndex: this.currentPage, // Sincroniza com a página atual
          type: BottomNavigationBarType.shifting,
          onTap: (int index) {
            setState(() {
              this.currentPage = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text('Favoritos'),
              backgroundColor: Colors.pink,
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              title: Text('Pesquisa'),
              backgroundColor: Colors.green,
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              title: Text('Agenda'),
              backgroundColor: Colors.orange,
              icon: Icon(Icons.calendar_today),
            ),
            BottomNavigationBarItem(
              title: Text('Perfil'),
              backgroundColor: Colors.blue,
              icon: Icon(Icons.account_circle),
            ),
          ],
        ));
  }
}
