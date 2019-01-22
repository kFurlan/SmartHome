import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  int currentPage = 3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Editar Perfil'),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 64.0,
                      backgroundImage: AssetImage('images/human.png'),
                    ),
                    Positioned(
                      top: 80,
                      left: 80,
                      child: IconButton(
                        icon: Icon(Icons.add_circle),
                        iconSize: 40.0,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'NOME',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'DATA DE NASCIMENTO',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'NÚMERO DE TELEFONE',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'SENHA',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
