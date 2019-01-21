import 'package:flutter/material.dart';
import 'package:smarthome/pages/profile_edit.dart';

class ProfileInfoPage extends StatefulWidget {
  @override
  _ProfileInfoPageState createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  int currentPage = 3;

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
                  backgroundImage: AssetImage('images/human.png'),
                  backgroundColor: Colors.blue,
                ),
                trailing: OutlineButton(
                  child: Text(
                    'EDITAR PERFIL',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileEditPage(),
                      ),
                    );
                  },
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
    ));
  }
}